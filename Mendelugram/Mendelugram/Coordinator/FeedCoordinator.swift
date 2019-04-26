//
//  FeedCoordinator.swift
//  Mendelugram
//
//  Created by Pacek on 24/04/2019.
//

import UIKit

class FeedCoordinator: Coordinating {

    private let resolver: DependencyResolving
    private weak var navController: UINavigationController?

    init(navController: UINavigationController, resolver: DependencyResolving) {
        self.navController = navController
        self.resolver = resolver
    }

    func begin() -> UIViewController {
        let viewController = resolver.resolveFeedViewController()
        viewController.coordinator = self
        return viewController
    }

    func select(photo: PhotoViewModeling) {
        let viewController = PhotoDetailCoordinator(viewModel: photo, resolver: resolver).begin()
        navController?.pushViewController(viewController, animated: true)
    }

    deinit {
        print("FeedCoordinator deinit")
    }

}
