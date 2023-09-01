//
//  APIConstant.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 1/9/2566 BE.
//

import Foundation

public enum URLString: String {
    case majorCineplexAPI = "https://www.majorcineplex.com/apis/get_movie_avaiable"
}

public enum UserResult<T> {
    case loading
    case success(result: T)
    case failure(error: NetworkError)
}

public enum Content<T,E:Error> {
    case loading
    case empty
    case success(data: T)
    case error(error: Error)
}

public enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case decodingError(error: String)
    case error(error: String)
}
