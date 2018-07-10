//
//  Copyright © 2018 John Crossley. All rights reserved.
//

import UIKit

public class Gyoza: UIView {

    public struct Action {
        public typealias Handler = () -> Void
        public let title: String
        public let handler: Handler

        public init(title: String, handler: @escaping Handler) {
            self.title = title
            self.handler = handler
        }
    }

    private let heightOfGyoza: CGFloat = {
        if #available(iOS 11.0, *) {
            if let safeAreaBottomHeight = UIApplication.shared.keyWindow?.safeAreaInsets.bottom {
                return safeAreaBottomHeight + 60
            }
        }
        return 60
    }()

    // MARK: Theming properties

    private let messageColor: UIColor
    private let actionLabelColor: UIColor

    // MARK: Properties

    private let message: String

    // MARK: Animation properties

    private let animateInDuration: TimeInterval
    private let animateOutDuration: TimeInterval
    private let animatePauseDuration: TimeInterval

    // MARK: Action

    private var action: Action?

    private var calculateMinimumHeight: CGFloat {
        if #available(iOS 11.0, *) {
            guard let height = UIApplication.shared.keyWindow?.safeAreaInsets.bottom else { return heightOfGyoza }
            return self.bounds.height + height
        }

        return self.bounds.height
    }

    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        return label
    }()

    private lazy var actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return button
    }()

    convenience public init?(block: ((GyozaBuilder) -> Void)) {
        let builder = GyozaBuilder()
        block(builder)
        self.init(builder: builder)
    }

    public init?(builder: GyozaBuilder) {
        guard let message = builder.message else { return nil }

        self.message = message
        self.messageColor = builder.messageColor
        self.action = builder.action
        self.actionLabelColor = builder.actionLabelColor

        self.animateInDuration = builder.animateInDuration
        self.animateOutDuration = builder.animateOutDuration
        self.animatePauseDuration = builder.animatePauseDuration

        super.init(frame: .zero)

        self.backgroundColor = builder.backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func decorateGyoza() {
        messageLabel.textColor = self.messageColor
    }

    @objc private func didTapActionButton(sender: UIButton) {
        action?.handler()
    }

    private func setupContainerView(on view: UIView) {
        view.addSubview(self)
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.heightAnchor.constraint(greaterThanOrEqualToConstant: heightOfGyoza).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        let stackView = UIStackView(frame: .zero)
        stackView.alignment = .top
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)

        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        stackView.spacing = 8

        stackView.addArrangedSubview(messageLabel)
        stackView.isUserInteractionEnabled = true

        if let action = self.action {
            actionButton.contentCompressionResistancePriority(for: .horizontal)
            actionButton.setContentHuggingPriority(.required, for: .horizontal)
            actionButton.setTitle(action.title, for: .normal)
            actionButton.setTitleColor(self.actionLabelColor, for: .normal)
            actionButton.addTarget(self, action: #selector(didTapActionButton(sender:)), for: .touchUpInside)
            stackView.addArrangedSubview(actionButton)
        }

        messageLabel.text = self.message
        self.layoutIfNeeded()
    }

    private func animateGyoza(on view: UIView) {
        self.transform = CGAffineTransform(translationX: 0, y: calculateMinimumHeight)
        // Could have used UIView.animateKeyframes but this way will allow the user to easily
        // specify a custom time without us having to do dem mad animateKeyFrames calculations 🤷🏻‍♀️
        UIView.animate(withDuration: self.animateInDuration,
                       delay: 0,
                       options: [],
                       animations: animateIn,
                       completion: animateInCompletion)
    }

    public func show(on view: UIView) {
        decorateGyoza()
        setupContainerView(on: view)
        animateGyoza(on: view)
    }

    // MARK: Animate
    private var animateIn: () -> Void {
        return {
            self.transform = CGAffineTransform(translationX: 0, y: 0)
        }
    }

    private var animateInCompletion: (Bool) -> Void {
        return { _ in
            Timer.scheduledTimer(timeInterval: self.animatePauseDuration,
                                 target: self,
                                 selector: #selector(self.continueAnimation),
                                 userInfo: nil,
                                 repeats: false)
        }
    }

    @objc private func continueAnimation() {
        UIView.animate(withDuration: self.animateOutDuration,
                       delay: 0,
                       options: [],
                       animations: self.animateOut,
                       completion: self.animateOutCompletion)
    }

    private var animateOut: () -> Void {
        return {
            self.transform = CGAffineTransform(translationX: 0, y: self.calculateMinimumHeight)
        }
    }

    private var animateOutCompletion: (Bool) -> Void {
        return { _ in
            self.removeFromSuperview()
        }
    }
}
