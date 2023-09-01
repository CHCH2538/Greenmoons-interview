//
//  HomeTableViewCell.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 1/9/2566 BE.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    
    // MARK: IBOutlet
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var titleENLabel: UILabel!
    @IBOutlet weak var titleTHLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        genreLabel.text = "Loading..."
        titleENLabel.text = "Loading..."
        titleTHLabel.text = "Loading..."
        releaseDateLabel.text = "Loading..."
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(posterUrl: String, genre: String, titleEN: String, titleTH: String, releaseDate: String) {
        posterImageView.layer.masksToBounds = true
        posterImageView.kf.indicatorType = .activity
        if let imageURL: URL = URL(string: posterUrl) {
            posterImageView.kf.setImage(with: imageURL, options: [.transition(.fade(0.2))])
        } else {
            posterImageView.image = UIImage(named: "questionmark.folder")
            posterImageView.tintColor = .systemYellow
        }
        genreLabel.text = genre
        titleENLabel.text = titleEN
        titleTHLabel.text = titleTH
        releaseDateLabel.text = releaseDate
    }
    
}
