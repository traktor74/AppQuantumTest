//
//  ApiService.swift
//  AppQuantumTest
//
//  Created by Pavel on 09/10/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case responseError
}

class ApiService {
    func loadObject<A>(ofType: A.Type,
                       url: URL,
                       completion: @escaping (Result<A, Error>) -> Void) where A: Decodable {
        let task = URLSession.shared.dataTask(with: url) { (data, reponse, error) in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else { return }
            if let httpResp = reponse as? HTTPURLResponse,
                httpResp.statusCode == 200 {
                if let responseDecoded = try? JSONDecoder().decode(A.self, from: data) {
                    completion(.success(responseDecoded))
                } else {
                    completion(.failure(ApiError.responseError))
                }
            }
        }
        task.resume()
    }
}

