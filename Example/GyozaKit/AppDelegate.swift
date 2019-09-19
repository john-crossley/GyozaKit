//
//  Copyright © 2018 John Crossley. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let controller = ViewController(nibName: nil, bundle: nil)
        controller.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)

        let nav = UINavigationController(rootViewController: controller)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()

        return true
    }
}
