//
//  PhotoTableViewCell.swift
//  Mendelugram
//
//  Created by Pacek on 21/04/2019.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    static let cellHeight: CGFloat = 430
    static let reuseIdentifier = String(describing: PhotoTableViewCell.self)

    struct Input {
        let avatar: UIImage
        let authorName: String
        let locationName: String?
        let photo: UIImage
    }

    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var authorNameLabel: UILabel!
    @IBOutlet private weak var locationNameLabel: UILabel!
    @IBOutlet private weak var photoImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
    }

    func configure(input: Input) {
        avatarImageView.image = input.avatar
        authorNameLabel.text = input.authorName
        locationNameLabel.text = input.locationName
        locationNameLabel.isHidden = input.locationName == nil
        photoImageView.image = input.photo
    }

}
