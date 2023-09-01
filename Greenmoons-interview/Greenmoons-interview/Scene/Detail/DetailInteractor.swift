//
//  DetailInteractor.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 2/9/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

protocol DetailBusinessLogic {
    func addFavorite(movie: Movies)
}

protocol DetailDataStore {
    var movieDetail: Movies? { get set }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore {
    var presenter: DetailPresentationLogic?
    lazy var worker: DetailWorker? = DetailWorker()
    var movieDetail: Movies?
    var tempFavorites: [Movies]?
    
    //​ MARK: Function
    
    func addFavorite(movie: Movies) {
        tempFavorites = getFavoriteMovie()
        if tempFavorites == nil {
            tempFavorites = [Movies]()
        }
        if !(tempFavorites?.contains(where: { $0.movieCode == movie.movieCode }) ?? false) {
            tempFavorites?.append(movie)
            clearFavoriteMovie()
            saveFavoriteMovie(favorite: tempFavorites ?? [Movies]())
        }
    }
}
