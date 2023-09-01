//
//  HomeWorker.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 1/9/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

import Foundation

class HomeWorker {
    func movieListWorker(onComplete: @escaping (Result<MoviesResponseModel, NetworkError>) -> Void) {
        let urlString: String = URLString.majorCineplexAPI.rawValue
        BaseAPI<MoviesResponseModel>.fetch(for: URL(string: urlString)!) { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    onComplete(.success(response))
                }
            case .failure(let error):
                onComplete(.failure(error))
            }
        }
    }
}
