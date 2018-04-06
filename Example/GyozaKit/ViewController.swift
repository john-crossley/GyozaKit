//
//  Copyright © 2018 John Crossley. All rights reserved.
//

import UIKit
import GyozaKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "SnackBarKit"

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show SnackBar", for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapShowButton(sender:)), for: .touchUpInside)

        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    @objc private func didTapShowButton(sender: UIButton) {
        presentGyoza()
    }

    private func presentGyoza() {

        let gyoza = Gyoza { builder in
            builder.message = "Jaded zombies acted quaintly but kept driving their oxen forward."
            builder.messageColor = .white
            builder.backgroundColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
            builder.actionLabelColor = UIColor(red: 0.16, green: 0.90, blue: 0.40, alpha: 1.00)

            builder.action = Gyoza.Action(title: "ACTION", handler: { [weak self] in
                guard let controller = self?.makeAlertController() else { return }
                self?.present(controller, animated: true, completion: nil)
            })
        }

        gyoza?.show(on: view)
    }

    private func makeAlertController() -> UIAlertController {
        let controller = UIAlertController(title: "Logout, Mr Snuggles?",
                                           message: "Are you sure you would like to logout of this amazing example?",
                                           preferredStyle: .alert)

        let okayAction = UIAlertAction(title: "Nah", style: .default, handler: nil)

        let deleteAction = UIAlertAction(title: "Logout", style: .destructive) { _ in

            let gyoza = Gyoza { builder in
                builder.message = "You have been signed out, Mr Snuggles 🥟"
            }

            gyoza?.show(on: self.view)
        }

        controller.addAction(okayAction)
        controller.addAction(deleteAction)

        return controller

    }
}

