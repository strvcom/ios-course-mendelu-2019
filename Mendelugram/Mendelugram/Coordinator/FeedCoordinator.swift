//
//  FeedCoordinator.swift
//  Mendelugram
//
//  Created by Pacek on 24/04/2019.
//

import UIKit

class FeedCoordinator: Coordinating {

    private weak var navController: UINavigationController?

    init(navController: UINavigationController) {
        self.navController = navController
    }

    func begin() -> UIViewController {
        let viewController = createFeedViewController()
        viewController.coordinator = self
        return viewController
    }

    func select(photo: PhotoViewModeling) {
        let viewController = PhotoDetailCoordinator(viewModel: photo).begin()
        navController?.pushViewController(viewController, animated: true)
    }

    deinit {
        print("FeedCoordinator deinit")
    }

}

private extension FeedCoordinator {

    func createFeedViewController() -> FeedViewController {
        let storyboard = UIStoryboard(name: "Feed", bundle: nil)
        return storyboard.instantiateInitialViewController() as! FeedViewController
    }

}
