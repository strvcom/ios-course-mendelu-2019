//
//  GridCoordinator.swift
//  Mendelugram
//
//  Created by Pacek on 25/04/2019.
//

import UIKit

class GridCoordinator: Coordinating {

    private weak var navController: UINavigationController?

    init(navController: UINavigationController) {
        self.navController = navController
    }

    func begin() -> UIViewController {
        let viewController = createGridViewController()
        viewController.coordinator = self
        return viewController
    }

    func select(photo: PhotoViewModeling) {
        let viewController = PhotoDetailCoordinator(viewModel: photo).begin()
        navController?.pushViewController(viewController, animated: true)
    }

    deinit {
        print("GridCoordinator deinit")
    }

}

private extension GridCoordinator {

    func createGridViewController() -> GridViewController {
        let storyboard = UIStoryboard(name: "Grid", bundle: nil)
        return storyboard.instantiateInitialViewController() as! GridViewController
    }

}
