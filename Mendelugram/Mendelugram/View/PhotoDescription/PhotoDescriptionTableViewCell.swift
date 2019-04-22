//
//  PhotoDescriptionTableViewCell.swift
//  Mendelugram
//
//  Created by Pacek on 21/04/2019.
//

import UIKit

class PhotoDescriptionTableViewCell: UITableViewCell {

    static let reuseIdentifier = String(describing: PhotoDescriptionTableViewCell.self)

    struct Input {
        let likesCount: Int
        let username: String
        let description: String
    }

    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(input: Input) {
        likesCountLabel.text = "\(input.likesCount) To se mi líbí"
        let username = NSAttributedString(string: input.username, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .semibold)])
        let description = NSAttributedString(string: " \(input.description)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .regular)])
        let attributedText = NSMutableAttributedString()
        attributedText.append(username)
        attributedText.append(description)
        descriptionLabel.attributedText = attributedText
    }
    
}
