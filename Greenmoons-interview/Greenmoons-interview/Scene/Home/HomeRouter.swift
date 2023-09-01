//
//  HomeRouter.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 1/9/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol HomeRoutingLogic {

}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: HomeRoutingLogic, HomeDataPassing {
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
  
    // MARK: Routing
  
}
