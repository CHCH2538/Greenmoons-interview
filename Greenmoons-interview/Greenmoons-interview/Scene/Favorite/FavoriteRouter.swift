//
//  FavoriteRouter.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 2/9/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol FavoriteRoutingLogic {
    func routeToDetail(movieDetail: Movies)
}

protocol FavoriteDataPassing {
    var dataStore: FavoriteDataStore? { get }
}

class FavoriteRouter: FavoriteRoutingLogic, FavoriteDataPassing {
    weak var viewController: FavoriteViewController?
    var dataStore: FavoriteDataStore?
  
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
