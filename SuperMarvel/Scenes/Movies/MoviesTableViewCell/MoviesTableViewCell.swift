//
//  MoviesTableViewCell.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import UIKit
protocol MoviesTableViewCellProtocol {
    func configureCell(series: SeriesModel)
}


class MoviesTableViewCell: UITableViewCell {
  
    @IBOutlet weak var movieImageCell: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        contentView.backgroundColor = .black
        contentView.layer.cornerRadius = 15
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.darkGray.cgColor
        contentView.layer.masksToBounds = false

        // Add a subtle shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
    }

    // Method to configure the cell with data
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
extension MoviesTableViewCell: MoviesTableViewCellProtocol{
    func configureCell(series: SeriesModel) {
        movieTitle.text = series.title
        //movieImageCell.getImage(imagePath: series.image)
        movieRate.text = series.rating
        movieYear.text = "Starts from:\(series.startYear)   Ends in:\(series.endYear)"
    }
}
