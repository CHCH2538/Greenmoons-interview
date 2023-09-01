//
//  FavoriteViewController.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 2/9/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol FavoriteDisplayLogic: AnyObject {

}

class FavoriteViewController: UIViewController {
    var interactor: FavoriteBusinessLogic?
    var router: (FavoriteRoutingLogic & FavoriteDataPassing)?
    
    // MARK: IBOutlet
    
    @IBOutlet weak var tableView: UITableView!

    // MARK: Object lifecycle
  
    override public func awakeFromNib() {
        super.awakeFromNib()
        configure(viewController: self)
    }

    // MARK: Setup
  
    func configure(viewController: FavoriteViewController) {
        let interactor: FavoriteInteractor = FavoriteInteractor()
        let presenter: FavoritePresenter = FavoritePresenter()
        let router: FavoriteRouter = FavoriteRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
  
    // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
  
    // MARK: Function
    
    func setupView() {
        self.title = "Cinemo"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewHeaderCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "HomeTableViewHeaderCell")
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
  
}

extension FavoriteViewController: FavoriteDisplayLogic {
 
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: HomeTableViewHeaderCell? = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HomeTableViewHeaderCell") as? HomeTableViewHeaderCell
        guard let headerView = headerView else {
            return UITableViewHeaderFooterView()
        }
        headerView.headerTitleLabel.text = "My Favorite"
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data: [Movies] = router?.dataStore?.favoriteList else { return 0 }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell
        guard let cell: HomeTableViewCell = cell, let movies: [Movies] = router?.dataStore?.favoriteList else { return UITableViewCell()}
        let movie: Movies = movies[indexPath.row]
        cell.setupCell(posterUrl: movie.poster_url ?? "", genre: movie.genre ?? "", titleEN: movie.title_en ?? "", titleTH: movie.title_th ?? "", releaseDate: movie.release_date?.convertToFormattedDate() ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movies: [Movies] = router?.dataStore?.favoriteList else { return }
        let movie: Movies = movies[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        router?.routeToDetail(movieDetail: movie)
    }
}
