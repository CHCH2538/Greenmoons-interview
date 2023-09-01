//
//  DetailViewController.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 2/9/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

import UIKit
import Kingfisher

protocol DetailDisplayLogic: AnyObject {

}

class DetailViewController: UIViewController {
    var interactor: DetailBusinessLogic?
    var router: (DetailRoutingLogic & DetailDataPassing)?
    
    // MARK: IBOutlet
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var enTitleLabel: UILabel!
    @IBOutlet weak var thTitleLabel: UILabel!
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var addToFavoriteButton: UIButton!
    
    // MARK: Object lifecycle
  
    override public func awakeFromNib() {
        super.awakeFromNib()
        configure(viewController: self)
    }

    // MARK: Setup
  
    func configure(viewController: DetailViewController) {
        let interactor: DetailInteractor = DetailInteractor()
        let presenter: DetailPresenter = DetailPresenter()
        let router: DetailRouter = DetailRouter()
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
        posterImageView.layer.masksToBounds = true
        if let movieDetail: Movies = router?.dataStore?.movieDetail {
            posterImageView.kf.indicatorType = .activity
            if let imageURL = URL(string: movieDetail.poster_url ?? "") {
                self.posterImageView.kf.setImage(with: imageURL, options: [.transition(.flipFromLeft(0.5))])
            }
            genreLabel.text = movieDetail.genre
            enTitleLabel.text = movieDetail.title_en
            thTitleLabel.text = movieDetail.title_th
            storyLabel.text = movieDetail.synopsis_th
        }
    }
  
}

extension DetailViewController: DetailDisplayLogic {
 
}
