//
//  PhotosListEndPoint.swift
//  AppQuantumTest
//
//  Created by Pavel on 09/10/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import Foundation

struct PhotosListEndPoint {
    private let baseUrl: String = "https://picsum.photos"
    let method: String = "GET" // in that project only get requests
    let path: String = "/v2/list"
    var url: URL {
        return URL(string: "\(baseUrl)\(path)")!
    }
}
