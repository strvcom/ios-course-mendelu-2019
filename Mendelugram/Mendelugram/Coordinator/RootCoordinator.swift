//
//  RootCoordinator.swift
//  Mendelugram
//
//  Created by Pacek on 24/04/2019.
//

import UIKit

class RootCoordinator: Coordinating {

    private let resolver: DependencyResolving

    init(resolver: DependencyResolving) {
        self.resolver = resolver
    }

    func begin() -> UIViewController {
        let tabBarController = resolver.resolveMainTabBarController()
        tabBarController.viewControllers = [
            beginFeed(),
            beginGrid()
        ]
        return tabBarController
    }

}

private extension RootCoordinator {

    func beginFeed() -> UIViewController {
        let navController = MendeluNavigationController()
        let coordinator = FeedCoordinator(navController: navController, resolver: resolver)
        let viewController = coordinator.begin()
        navController.viewControllers = [viewController]
        return navController
    }

    func beginGrid() -> UIViewController {
        let navController = MendeluNavigationController()
        let coordinator = GridCoordinator(navController: navController, resolver: resolver)
        let viewController = coordinator.begin()
        navController.viewControllers = [viewController]
        return navController
    }

}
