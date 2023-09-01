//
//  HomeViewController.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 1/9/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displayFetchMovieList(viewModel: Home.MoviesList.ViewModel)
}

class HomeViewController: UIViewController {
    var interactor: HomeBusinessLogic?
    var router: (HomeRoutingLogic & HomeDataPassing)?
    
    // MARK: IBOutlet
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Object lifecycle
  
    override public func awakeFromNib() {
        super.awakeFromNib()
        configure(viewController: self)
    }

    // MARK: Setup
  
    func configure(viewController: HomeViewController) {
        let interactor: HomeInteractor = HomeInteractor()
        let presenter: HomePresenter = HomePresenter()
        let router: HomeRouter = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
  
    // MARK: View lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    // MARK: Function
    
    func setupView() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = .black
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.compactAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(favouriteButtonTapped))
        self.navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewHeaderCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "HomeTableViewHeaderCell")
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        interactor?.fetchMovieList(request: .init())
    }
    
    private func startLoading() {
        loadingView.isHidden = false
        activityIndicatorView.startAnimating()
    }
    
    private func stopLoading() {
        loadingView.isHidden = true
        activityIndicatorView.stopAnimating()
    }
    
    @objc private func favouriteButtonTapped() {
        
    }
}

extension HomeViewController: HomeDisplayLogic {
    func displayFetchMovieList(viewModel: Home.MoviesList.ViewModel) {
        switch viewModel.content {
        case .loading:
            startLoading()
        case .success:
            stopLoading()
            tableView.reloadData()
        case .error:
            stopLoading()
        default:
            break
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: HomeTableViewHeaderCell? = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HomeTableViewHeaderCell") as? HomeTableViewHeaderCell
        guard let headerView = headerView else {
            return UITableViewHeaderFooterView()
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data: [Movies] = router?.dataStore?.moviesList?.movies else { return 0 }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell
        guard let cell: HomeTableViewCell = cell, let movies: [Movies] = router?.dataStore?.moviesList?.movies else { return UITableViewCell()}
        let movie: Movies = movies[indexPath.row]
        cell.setupCell(posterUrl: movie.poster_url ?? "", genre: movie.genre ?? "", titleEN: movie.title_en ?? "", titleTH: movie.title_th ?? "", releaseDate: movie.release_date?.convertToFormattedDate() ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movies: [Movies] = router?.dataStore?.moviesList?.movies else { return }
        let movie: Movies = movies[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
