//
//  AppDelegate.swift
//  FetchRdmUser
//
//  Created by Saúl Pérez on 24/08/22.
//

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var persistentContainer: NSPersistentContainer?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        createContainer { container in
            self.persistentContainer = container
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = MainController(context: container.viewContext)
            self.window?.makeKeyAndVisible()
        }
        return true
    }


}
