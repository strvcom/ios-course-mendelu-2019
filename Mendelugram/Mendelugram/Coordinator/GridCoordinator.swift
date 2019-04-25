//
//  GridCoordinator.swift
//  Mendelugram
//
//  Created by Pacek on 25/04/2019.
//

import UIKit

class GridCoordinator: Coordinating {

    private let resolver: DependencyResolving
    private weak var navController: UINavigationController?

    init(navController: UINavigationController, resolver: DependencyResolving) {
        self.navController = navController
        self.resolver = resolver
    }

    func begin() -> UIViewController {
        let viewController = resolver.resolveGridViewController()
        viewController.coordinator = self
        return viewController
    }

    func select(photo: PhotoViewModeling) {
        let viewController = PhotoDetailCoordinator(viewModel: photo, resolver: resolver).begin()
        navController?.pushViewController(viewController, animated: true)
    }

    deinit {
        print("GridCoordinator deinit")
    }

}
