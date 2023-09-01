//
//  HomePresenter.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 1/9/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

protocol HomePresentationLogic {
    func presentFetchMovieList(response: Home.MoviesList.Response)
}

class HomePresenter: HomePresentationLogic {
    weak var viewController: HomeDisplayLogic?
  
    // MARK: Function
    func presentFetchMovieList(response: Home.MoviesList.Response) {
        typealias ViewModel = Home.MoviesList.ViewModel
        typealias ErrorCase = Home.MoviesList.ErrorCase
        var viewModel: ViewModel
        
        switch response.result {
        case .loading:
            viewModel = ViewModel(content: .loading)
        case .success(let result):
            viewModel = ViewModel(content: .success(data: result))
        case .failure(let error):
            viewModel = ViewModel(content: .error(error: error))
        }
        viewController?.displayFetchMovieList(viewModel: viewModel)
    }
}
