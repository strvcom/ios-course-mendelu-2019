//
//  MainTabBarViewController.swift
//  Mendelugram
//
//  Created by Pacek on 20/04/2019.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

}

private extension MainTabBarViewController {

    func configure() {
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor.contrastGray
    }

}
