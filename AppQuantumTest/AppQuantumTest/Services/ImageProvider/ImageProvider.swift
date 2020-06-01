//
//  ImageProvider.swift
//  AppQuantumTest
//
//  Created by Pavel on 09/10/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import Foundation

protocol ImageProvider {
    func fetchImagesData(completion: @escaping (Result<[ImageInfoResponse], Error>) -> Void)
    func fetchImages(for images: [ImageInfoResponse], progress: (Int) -> Void) -> [(id: String, data: Data)]
}
