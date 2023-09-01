//
//  DetailRouter.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 2/9/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol DetailRoutingLogic {

}

protocol DetailDataPassing {
    var dataStore: DetailDataStore? { get }
}

class DetailRouter: DetailRoutingLogic, DetailDataPassing {
    weak var viewController: DetailViewController?
    var dataStore: DetailDataStore?
  
    // MARK: Routing
  
}
