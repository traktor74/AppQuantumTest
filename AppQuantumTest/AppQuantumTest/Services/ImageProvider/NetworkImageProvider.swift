//
//  NetworkImageProvider.swift
//  AppQuantumTest
//
//  Created by Pavel on 10/10/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import Foundation

class NetworkImageProvider: ImageProvider {
    private let apiService = ApiService() // TODO: injection
    
    func fetchImagesData(completion: @escaping (Swift.Result<[ImageInfoResponse], Error>) -> Void) {
        let url = PhotosListEndPoint().url
        apiService.loadObject(ofType: [ImageInfoResponse].self, url: url) { result in
            completion(result)
        }
    }
    
    // TODO: асинхронная загрузка другими способами
    func fetchImages(for images: [ImageInfoResponse], progress: (Int) -> Void) -> [(id: String, data: Data)] {
        var result: [(id: String, data: Data)] = []
        for imageData in images {
            let iconUrl = URL(string: imageData.downloadUrl)
            if let data = try? Data(contentsOf: iconUrl!) {
                result.append((id: imageData.id, data: data))
                progress(result.count)
            }
        }
        return result
    }
}

// TODO: mock the images
//class MockImageProvider: ImageProvider {
//    func fetchImagesData(completion: @escaping (Result<[ImageInfoResponse], Error>) -> Void) {
//
//    }
//
//    func fetchImages(for images: [ImageInfoResponse], progress: (Int) -> Void) -> [UIImage] {
//
//    }
//}
