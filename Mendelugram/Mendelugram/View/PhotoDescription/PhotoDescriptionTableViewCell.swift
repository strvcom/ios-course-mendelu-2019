//
//  PhotoDescriptionTableViewCell.swift
//  Mendelugram
//
//  Created by Pacek on 21/04/2019.
//

import UIKit

class PhotoDescriptionTableViewCell: UITableViewCell, NibNameIdentifiable {

    struct Input {
        let likesCount: Int
        let username: String
        let description: String
    }

    @IBOutlet private weak var likesCountLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    func configure(with input: Input) {
        likesCountLabel.text = "\(input.likesCount) To se mi líbí"
        let username = NSAttributedString(string: input.username, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .semibold)])
        let description = NSAttributedString(string: " \(input.description)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .regular)])
        let attributedText = NSMutableAttributedString()
        attributedText.append(username)
        attributedText.append(description)
        descriptionLabel.attributedText = attributedText
    }
    
}
