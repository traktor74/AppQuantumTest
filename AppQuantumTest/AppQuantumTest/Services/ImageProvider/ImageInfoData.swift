//
//  ImageInfoData.swift
//  AppQuantumTest
//
//  Created by Pavel on 09/10/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import Foundation
import UIKit

class ImageInfoData {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let image: UIImage
    let thumbnail: UIImage
    
    init(with imageResponse: ImageInfoResponse,
         thumbnail: UIImage,
         image: UIImage) {
        self.id = imageResponse.id
        self.author = imageResponse.author
        self.width = imageResponse.width
        self.height = imageResponse.height
        self.thumbnail = thumbnail
        self.image = image
    }
}

