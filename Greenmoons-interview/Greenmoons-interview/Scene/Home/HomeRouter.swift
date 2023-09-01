//
//  HomeRouter.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 1/9/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol HomeRoutingLogic {
    func routeToDetail(movieDetail: Movies)
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: HomeRoutingLogic, HomeDataPassing {
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
  
    // MARK: Routing
    
    func routeToDetail(movieDetail: Movies) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        var dataStore = vc?.router?.dataStore
        dataStore?.movieDetail = movieDetail
        guard let vc = vc else { return }
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
  
}
