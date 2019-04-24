//
//  PhotosCollectionViewModel.swift
//  Mendelugram
//
//  Created by Pacek on 24/04/2019.
//

import UIKit

class PhotosCollectionViewModel: PhotosCollectionViewModeling {

    var didUpdatePhotos: (() -> Void)?

    private var photos = [Photo]()
    private let photosService: PhotosServicing

    init(photosService: PhotosServicing) {
        self.photosService = photosService
    }

    func updatePhotos() {
        photosService.fetchPhotos { [weak self] photos in
            self?.photos = photos
            self?.didUpdatePhotos?()
        }
    }

    func numberOfPhotos() -> Int {
        return photos.count
    }

    func photo(at index: Int) -> PhotoViewModeling {
        return PhotoViewModel(model: photos[index])
    }

}
