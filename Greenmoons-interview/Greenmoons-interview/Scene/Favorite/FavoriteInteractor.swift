//
//  FavoriteInteractor.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 2/9/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

protocol FavoriteBusinessLogic {

}

protocol FavoriteDataStore {
    var favoriteList: [Movies]? { get set }
}

class FavoriteInteractor: FavoriteBusinessLogic, FavoriteDataStore {
    var presenter: FavoritePresentationLogic?
    lazy var worker: FavoriteWorker? = FavoriteWorker()
    var favoriteList: [Movies]? = getFavoriteMovie()
    
    //​ MARK: Function
  
}
