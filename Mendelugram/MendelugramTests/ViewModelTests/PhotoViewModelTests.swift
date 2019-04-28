//
//  PhotoViewModelTests.swift
//  MendelugramTests
//
//  Created by David Aldorf on 28/04/2019.
//

import XCTest
@testable import Mendelugram

//protocol PhotoViewModeling {
//
//    var author: AuthorViewModeling { get }
//    var likesCount: Int { get }
//    var description: String { get }
//    var locationName: String? { get }
//    var photo: UIImage { get }
//
//    func numberOfComments() -> Int
//    func comment(at index: Int) -> CommentViewModeling
//
//}
//
//extension PhotoViewModeling {
//
//    var title: String {
//        return "\(author.username)'s photo"
//    }
//
//}



class PhotoViewModelTests: XCTestCase {

    // MARK: - Constants
    private struct Constants {
        static private let selena = Author(username: "selenagomez", name: "Selena Gomez", avatarId: "selena")
        static private let oprah = Author(username: "oprah", name: "Oprah", avatarId: "oprah")
        
        static let commentSelena = Comment(text: "STAND BY TO GET SOME.", author: selena)
        static let commentOprah = Comment(text: "??", author: oprah)
        
        static let mockPhoto = Photo(
            author: Constants.selena,
            likesCount: 6543234567,
            description: "bla bla bla",
            locationName: nil,
            comments: [commentSelena, commentOprah],
            photoId: "selena-2"
        )
    }
    
    func testNumberOfCommentsSuccess() {
        let viewModel = PhotoViewModel(model: Constants.mockPhoto)
        
        XCTAssert(viewModel.numberOfComments() == 2, "didUpdatePhotos should be called")
    }
    
    func testCommentsAtIndexesSuccess() {
        let viewModel = PhotoViewModel(model: Constants.mockPhoto)
        
        XCTAssertEqual(
            viewModel.comment(at: 0).text,
            Constants.commentSelena.text,
            "Comment at index 0 should be: \(Constants.commentSelena.text)"
        )

        XCTAssertEqual(
            viewModel.comment(at: 1).text,
            Constants.commentOprah.text,
            "Comment at index 0 should be: \(Constants.commentOprah.text)"
        )
    }
}
