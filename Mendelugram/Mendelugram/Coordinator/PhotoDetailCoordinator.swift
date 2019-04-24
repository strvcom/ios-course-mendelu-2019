//
//  PhotoDetailCoordinator.swift
//  Mendelugram
//
//  Created by Pacek on 24/04/2019.
//

import UIKit

class PhotoDetailCoordinator: Coordinating {

    private let viewModel: PhotoViewModeling

    init(viewModel: PhotoViewModeling) {
        self.viewModel = viewModel
    }

    func begin() -> UIViewController {
        let viewController = createPhotoDetailViewController()
        viewController.coordinator = self
        return viewController
    }

    deinit {
        print("PhotoDetailCoordinator deinit")
    }

}

private extension PhotoDetailCoordinator {

    func createPhotoDetailViewController() -> PhotoDetailViewController {
        let storyboard = UIStoryboard(name: "PhotoDetail", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! PhotoDetailViewController
        viewController.hidesBottomBarWhenPushed = true
        viewController.viewModel = viewModel
        return viewController
    }

}
