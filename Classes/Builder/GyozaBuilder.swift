//
//  Copyright © 2018 James Ruston. All rights reserved.
//

import UIKit

public class GyozaBuilder {
    public var message: String?
    public var messageColor: UIColor = .white
    public var messageAlignment: UIStackViewAlignment = .top
    public var action: Gyoza.Action?
    public var backgroundColor: UIColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
    public var actionLabelColor: UIColor = UIColor(red: 0.16, green: 0.90, blue: 0.40, alpha: 1.00)

    public var animateInDuration: TimeInterval = 0.5
    public var animateOutDuration: TimeInterval = 0.5
    public var animatePauseDuration: TimeInterval = 3

}
