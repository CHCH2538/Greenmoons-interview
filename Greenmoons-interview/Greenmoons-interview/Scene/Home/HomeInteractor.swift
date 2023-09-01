//
//  HomeInteractor.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 1/9/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

protocol HomeBusinessLogic {
    func fetchMovieList(request: Home.MoviesList.Request)
}

protocol HomeDataStore {
    var moviesList: MoviesResponseModel? { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    var presenter: HomePresentationLogic?
    lazy var worker: HomeWorker? = HomeWorker()
    var moviesList: MoviesResponseModel?
    
    //​ MARK: Function
    
    func fetchMovieList(request: Home.MoviesList.Request) {
        typealias Response = Home.MoviesList.Response
        presenter?.presentFetchMovieList(response: .init(result: .loading))
        worker?.movieListWorker( onComplete: { [weak self] responses in
            let responseModel: Response
            switch responses {
            case .success(let result):
                self?.moviesList = result
                responseModel = Response(result: .success(result: result))
            case .failure(let error):
                responseModel = Response(result: .failure(error: error))
            }
            self?.presenter?.presentFetchMovieList(response: responseModel)
        })
    }
}
