//
//  PhotoDetailViewController.swift
//  Mendelugram
//
//  Created by Pacek on 21/04/2019.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photo: Photo!

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "\(photo.author.username)'s photo"
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: PhotoTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: PhotoTableViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: CommentTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CommentTableViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: PhotoDescriptionTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: PhotoDescriptionTableViewCell.reuseIdentifier)
        tableView.delegate = self
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
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.reuseIdentifier, for: indexPath) as! PhotoTableViewCell
            cell.configure(
                input: PhotoTableViewCell.Input(
                    avatar: UIImage(avatarId: photo.author.avatarId),
                    authorName: photo.author.name,
                    locationName: photo.locationName,
                    photo: UIImage(photoId: photo.photoId)
                )
            )
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotoDescriptionTableViewCell.reuseIdentifier, for: indexPath) as! PhotoDescriptionTableViewCell
            cell.configure(
                input: PhotoDescriptionTableViewCell.Input(
                    likesCount: photo.likesCount,
                    username: photo.author.username,
                    description: photo.description
                )
            )
            return cell
        case 2:
            let comment = photo.comments[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.reuseIdentifier, for: indexPath) as! CommentTableViewCell
            cell.configure(
                input: CommentTableViewCell.Input(
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

extension PhotoDetailViewController: UITableViewDelegate {}
