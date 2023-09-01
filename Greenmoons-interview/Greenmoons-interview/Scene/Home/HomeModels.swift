//
//  HomeModels.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 1/9/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

enum Home {
  
    // MARK: Use cases
    
    enum  MoviesList {
        
        struct Request {}
        
        struct Response {
            let result: UserResult<MoviesResponseModel>
        }
        
        struct ViewModel {
            let content: Content<MoviesResponseModel, ErrorCase>
        }
        
        enum ErrorCase: Error {
  
        }
    }
  
}
