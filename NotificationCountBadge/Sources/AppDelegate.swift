//
//  AppDelegate.swift
//  NotificationCountBadge
//
//  Created by Burak Ekmen on 6.12.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.rootViewController = BadgeBuilder.generate()
        window?.makeKeyAndVisible()
        return true
    }
}

