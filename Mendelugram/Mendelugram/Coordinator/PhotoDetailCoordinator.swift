//
//  PhotoDetailCoordinator.swift
//  Mendelugram
//
//  Created by Pacek on 24/04/2019.
//

import UIKit

class PhotoDetailCoordinator: Coordinating {

    private let viewModel: PhotoViewModeling
    private let resolver: DependencyResolving

    init(viewModel: PhotoViewModeling, resolver: DependencyResolving) {
        self.viewModel = viewModel
        self.resolver = resolver
    }

    func begin() -> UIViewController {
        let viewController = resolver.resolvePhotoDetailViewController(viewModel: viewModel)
        viewController.coordinator = self
        return viewController
    }

    deinit {
        print("PhotoDetailCoordinator deinit")
    }

}
