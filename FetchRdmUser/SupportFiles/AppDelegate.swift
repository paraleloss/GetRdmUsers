//
//  AppDelegate.swift
//  FetchRdmUser
//
//  Created by Saúl Pérez on 24/08/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = MainController()
        window?.makeKeyAndVisible()
    
        return true
    }
}
