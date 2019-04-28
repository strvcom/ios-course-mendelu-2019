//
//  PhotosCollectionViewModelTests.swift
//  MendelugramTests
//
//  Created by David Aldorf on 28/04/2019.
//

import XCTest
@testable import Mendelugram

// We are testing protocols! :)

// Don't forget DI is used for mocking your functionalities.
// We use mocked classes for isolating conditions we are depending on.

//protocol PhotosCollectionViewModeling {
//
//    var didUpdatePhotos: (() -> Void)? { get set }
//
//    func updatePhotos()
//    func numberOfPhotos() -> Int
//    func photo(at index: Int) -> PhotoViewModeling
//
//}

class PhotosCollectionViewModelTests: XCTestCase {

    // MARK: - Constants (static)
    
    private struct Constants {
        
        static private let casey = Author(username: "caseyneistat", name: "Casey Neistat", avatarId: "casey")
        static private let selena = Author(username: "selenagomez", name: "Selena Gomez", avatarId: "selena")
        
        static let mockPhoto = Photo(
            author: Constants.selena,
            likesCount: 6543234567,
            description: "bla bla bla",
            locationName: nil,
            comments: [],
            photoId: "selena-2"
        )
        static let mockPhoto2 = Photo(
            author: Constants.selena,
            likesCount: 3456789,
            description: "bla bla bla",
            locationName: nil,
            comments: [],
            photoId: "selena-3"
        )
        static let mockPhoto3 = Photo(
            author: Constants.casey,
            likesCount: 76543,
            description: "bla bla bla",
            locationName: nil,
            comments: [],
            photoId: "casey-3"
        )
    }
    
    // MARK: - Mock Service
    
    private struct MockPhotosService: PhotosServicing {
        
        var photos = [Photo]()
        
        func fetchPhotos(completion: @escaping ([Photo]) -> Void) {
            
            completion(photos)
        }
    }
    
    // MARK: - Variables
    
    private var mockPhotosService = MockPhotosService()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        mockPhotosService.photos = [
            Constants.mockPhoto,
            Constants.mockPhoto2,
            Constants.mockPhoto3
        ]
    }
    
    // MARK: - Test Cases
    
    func testUpdatePhotosSuccess() {
        let viewModel = PhotosCollectionViewModel(photosService: mockPhotosService)
        
        var updateSuccessful = false
        
        viewModel.didUpdatePhotos = {
            
            updateSuccessful = true
        }
        viewModel.updatePhotos()
        
        XCTAssert(updateSuccessful, "didUpdatePhotos should be called")
    }
    
    func testUpdatePhotosNumberSuccess() {
        let viewModel = PhotosCollectionViewModel(photosService: mockPhotosService)
        
        // First we are gonna to check if the number of photos is zero
        XCTAssert(viewModel.numberOfPhotos() == 0, "Number of photos should be 0")
        
        // #didUpdatePhotos()# should be initialized first it's closure used in #didUpdatePhotos()#
        viewModel.didUpdatePhotos = {
            
            XCTAssert(viewModel.numberOfPhotos() == 3, "Number of photos should be 3")
        }
        viewModel.updatePhotos()
    }
}
