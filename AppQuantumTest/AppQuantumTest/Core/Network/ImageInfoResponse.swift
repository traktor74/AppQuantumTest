//
//  ImageInfoResponse.swift
//  AppQuantumTest
//
//  Created by Pavel on 09/10/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import Foundation

struct ImageInfoResponse {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: String
    let downloadUrl: String
}

extension ImageInfoResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case author
        case width
        case height
        case url
        case downloadUrl = "download_url"
    }
}
