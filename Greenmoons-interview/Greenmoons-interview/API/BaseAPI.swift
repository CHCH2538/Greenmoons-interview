//
//  BaseAPI.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 1/9/2566 BE.
//

import Foundation

final class BaseAPI <T: Codable> {
    
    static func fetch(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {

        URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard error == nil else {
                completion(.failure(.error(error: error!.localizedDescription)))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))

            } catch let err {
                print (String(describing: err))
                completion(.failure(.decodingError(error: err.localizedDescription)))
            }
        }.resume()
    }
}
