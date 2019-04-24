//
//  RootCoordinator.swift
//  Mendelugram
//
//  Created by Pacek on 24/04/2019.
//

import UIKit

class RootCoordinator: Coordinating {

    func begin() -> UIViewController {
        let tabBarController = createRootViewController()
        tabBarController.viewControllers = [
            beginFeed(),
            beginGrid()
        ]
        return tabBarController
    }

}

private extension RootCoordinator {

    func createRootViewController() -> UITabBarController {
        let storyboard = UIStoryboard(name: "MainTabBar", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UITabBarController
    }

    func beginFeed() -> UIViewController {
        let navController = MendeluNavigationController()
        let coordinator = FeedCoordinator(navController: navController)
        let viewController = coordinator.begin()
        navController.viewControllers = [viewController]
        return navController
    }

    func beginGrid() -> UIViewController {
        let navController = MendeluNavigationController()
        let coordinator = GridCoordinator(navController: navController)
        let viewController = coordinator.begin()
        navController.viewControllers = [viewController]
        return navController
    }

}
