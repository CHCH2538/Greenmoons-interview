//
//  DetailInteractor.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 2/9/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

protocol DetailBusinessLogic {

}

protocol DetailDataStore {
    var movieDetail: Movies? { get set }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore {
    var presenter: DetailPresentationLogic?
    lazy var worker: DetailWorker? = DetailWorker()
    var movieDetail: Movies?
    
    //​ MARK: Function
  
}
