//
//  ApiService.swift
//  AppQuantumTest
//
//  Created by Pavel on 09/10/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import Foundation

class ApiService {
    func loadObject<A>(ofType: A.Type,
                       url: URL,
                       completion: @escaping (Swift.Result<A, Error>) -> Void) where A: Decodable {
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
                    let responseError = NSError(domain: "response failed", code: 999, userInfo: nil)
                    completion(.failure(responseError))
                }
            }
        }
        task.resume()
    }
}

