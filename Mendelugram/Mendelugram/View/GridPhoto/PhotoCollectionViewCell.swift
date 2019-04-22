//
//  PhotoCollectionViewCell.swift
//  Mendelugram
//
//  Created by Pacek on 21/04/2019.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = String(describing: PhotoCollectionViewCell.self)

    struct Input {
        let photo: UIImage
    }

    @IBOutlet weak var photoImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(input: Input) {
        photoImageView.image = input.photo
    }

}
