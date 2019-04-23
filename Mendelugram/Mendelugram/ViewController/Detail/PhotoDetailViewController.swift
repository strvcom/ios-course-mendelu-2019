//
//  PhotoDetailViewController.swift
//  Mendelugram
//
//  Created by Pacek on 21/04/2019.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photo: Photo!

    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

}

private extension PhotoDetailViewController {

    func configure() {
        title = "\(photo.author.username)'s photo"
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PhotoTableViewCell.nib, forCellReuseIdentifier: PhotoTableViewCell.identifier)
        tableView.register(CommentTableViewCell.nib, forCellReuseIdentifier: CommentTableViewCell.identifier)
        tableView.register(PhotoDescriptionTableViewCell.nib, forCellReuseIdentifier: PhotoDescriptionTableViewCell.identifier)
        tableView.dataSource = self
    }

}

extension PhotoDetailViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section <= 1 ? 1 : photo.comments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.identifier, for: indexPath) as! PhotoTableViewCell
            cell.configure(
                with: PhotoTableViewCell.Input(
                    avatar: UIImage(avatarId: photo.author.avatarId),
                    authorName: photo.author.name,
                    locationName: photo.locationName,
                    photo: UIImage(photoId: photo.photoId)
                )
            )
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotoDescriptionTableViewCell.identifier, for: indexPath) as! PhotoDescriptionTableViewCell
            cell.configure(
                with: PhotoDescriptionTableViewCell.Input(
                    likesCount: photo.likesCount,
                    username: photo.author.username,
                    description: photo.description
                )
            )
            return cell
        case 2:
            let comment = photo.comments[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier, for: indexPath) as! CommentTableViewCell
            cell.configure(
                with: CommentTableViewCell.Input(
                    avatar: UIImage(avatarId: comment.author.avatarId),
                    username: comment.author.username,
                    comment: comment.text
                )
            )
            return cell
        default:
            fatalError("invalid section")
        }
    }

}
