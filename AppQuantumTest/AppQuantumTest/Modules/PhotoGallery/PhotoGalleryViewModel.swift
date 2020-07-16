//
//  PhotoGalleryViewModel.swift
//  AppQuantumTest
//
//  Created by Pavel on 09/10/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import Foundation
import UIKit

typealias FetchedData = [(id: String, data: Data)]

enum DownloadState {
    case started
    case infoLoaded(Int)
    case progress(Int)
    case finished([ImageInfoData])
    case imageProcessing
    case failed(Error)
}

class PhotoGalleryViewModel {
    
    let imageProvider: ImageProvider
    var onStateChange: ((DownloadState) -> Void)?
    
    private let hardcodedImageSize = CGSize(width: 99, height: 120) // temporary hardcode
    
    init(imageProvider: ImageProvider) {
        self.imageProvider = imageProvider
    }
    
    func handleViewDidLoad() {
        startLoadImages()
    }
    
    private func startLoadImages() {
        imageProvider.fetchImagesData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(imageResponses):
                self.onStateChange?(.infoLoaded(imageResponses.count))
                let fetchedData = self.imageProvider.fetchImages(for: imageResponses) { progress in
                    self.onStateChange?(.progress(progress))
                }
                self.onStateChange?(.imageProcessing)
                let imagesInfo = self.processImagesData(fetchedData, imageResponses)
                self.onStateChange?(.finished(imagesInfo))
            case let .failure(error):
                self.onStateChange?(.failed(error))
                print(error.localizedDescription)
            }
        }
    }
    
    private func processImagesData(_ fetchedData: FetchedData,_ imageResponses: [ImageInfoResponse]) -> [ImageInfoData] {
        var processedData: [ImageInfoData] = []
        for imageData in fetchedData {
            if let imageInfoResponse = imageResponses.first(where: { $0.id == imageData.id }),
                let image = UIImage(data: imageData.data),
                let thumbnail = image.resizedImage(with: hardcodedImageSize) {
                let imageInfo = ImageInfoData(with: imageInfoResponse, thumbnail: thumbnail, image: image)
                processedData.append(imageInfo)
            }
        }
        return processedData
    }
    
}
