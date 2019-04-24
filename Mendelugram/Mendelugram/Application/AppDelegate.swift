//
//  AppDelegate.swift
//  Mendelugram
//
//  Created by Pacek on 20/04/2019.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootCoordinator: RootCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        rootCoordinator = RootCoordinator()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootCoordinator?.begin()
        window?.makeKeyAndVisible()
        return true
    }

}

