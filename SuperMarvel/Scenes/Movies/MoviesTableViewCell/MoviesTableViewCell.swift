//
//  MoviesTableViewCell.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import UIKit
import Kingfisher

protocol MoviesTableViewCellProtocol {
    func configureCell(series: MarvelResult)
}

class MoviesTableViewCell: UITableViewCell {
  
    @IBOutlet weak var movieImageCell: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setupCellUI()
    }
    
    func configureCell(title: String, year: String, rate: String, image: UIImage?) {
        movieTitle.text = title
        movieYear.text = year
        movieRate.text = rate
        movieImageCell.image = image
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension MoviesTableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension MoviesTableViewCell: MoviesTableViewCellProtocol {
    func configureCell(series: MarvelResult) {
        
        movieTitle.text = series.title
    
        if let seriesRating = series.rating, !seriesRating.isEmpty {
            movieRate.text = seriesRating
        } else {
            movieRate.text = "Rated A"
        }
        
        if let startYear = series.startYear, let endYear = series.endYear {
            movieYear.text = "From: \(startYear) To: \(endYear)"
        } else {
            movieYear.text = "Not Available"
        }
        
        let imagePath = series.thumbnail?.path ?? ""
        let seriesImageURLString = "\(imagePath).jpg"
        
        if let seriesImageURL = URL(string: seriesImageURLString) {
            movieImageCell.kf.setImage(with: seriesImageURL)
            self.movieImageCell.layer.cornerRadius = 15
            self.movieImageCell.layer.masksToBounds = true
        } else {
           
            print("Invalid URL: \(seriesImageURLString)")
        }
    }
    
}
