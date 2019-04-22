//
//  CommentTableViewCell.swift
//  Mendelugram
//
//  Created by Pacek on 21/04/2019.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    static let reuseIdentifier = String(describing: CommentTableViewCell.self)

    struct Input {
        let avatar: UIImage
        let username: String
        let comment: String
    }

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.layer.masksToBounds = true
    }

    func configure(input: Input) {
        let username = NSAttributedString(string: input.username, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .semibold)])
        let comment = NSAttributedString(string: " \(input.comment)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .regular)])
        let attributedText = NSMutableAttributedString()
        attributedText.append(username)
        attributedText.append(comment)
        commentLabel.attributedText = attributedText
        avatarImageView.image = input.avatar
    }
    
}
