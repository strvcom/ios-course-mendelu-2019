//
//  MendeluNavigationController.swift
//  Mendelugram
//
//  Created by Pacek on 20/04/2019.
//

import UIKit

class MendeluNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

}

private extension MendeluNavigationController {

    func configure() {
        navigationBar.tintColor = UIColor.contrastGray
        navigationBar.isTranslucent = false
    }

}
