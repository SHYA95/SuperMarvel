//
//  MovieDetailsViewController.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//
import UIKit
import Kingfisher
import NVActivityIndicatorView

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var seriesName: UILabel!
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var descriptionData: UILabel!
    @IBOutlet weak var ratingDate: UILabel!
    @IBOutlet weak var releaseTime: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var selectedSeries: MarvelResult?
    var series: MarvelResponse?
    
    init(series: MarvelResult) {
        super.init(nibName: nil, bundle: nil)
        self.selectedSeries = series
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    
    let randomRating = Int(arc4random_uniform(9) + 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    func setupData() {
        guard let series = selectedSeries else {
            return
        }
        seriesName.text = series.title
        
        if let seriesDescription = series.description, !seriesDescription.isEmpty {
            descriptionData.text = seriesDescription
        } else {
            descriptionData.text = "Description not available on our website. Visit our website for more details."
        }
        
        if let seriesResourceURI = series.resourceURI {
            descriptionData.text?.append("\n\nURL: \(seriesResourceURI)")
        }
        
        if let seriesModified = series.modified {
            descriptionData.text?.append("\nModified: \(seriesModified)")
        }
        
        if let seriesRating = series.rating, !seriesRating.isEmpty {
            ratingDate.text = seriesRating
        } else {
            ratingDate.text = "\(randomRating)"
        }
        
        if let startYear = series.startYear, let endYear = series.endYear {
            releaseTime.text = "From: \(startYear) To: \(endYear)"
            endTime.text = "\(endYear)"
        } else {
            releaseTime.text = "Not Available"
        }
        
        let imagePath = series.thumbnail?.path ?? ""
        let seriesImageURLString = "\(imagePath).jpg"
        
        if let seriesImageURL = URL(string: seriesImageURLString) {
            detailsImageView.kf.setImage(with: seriesImageURL)
        } else {
            print("Invalid URL: \(seriesImageURLString)")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        MovingTo.dismissMoviesViewController(on: self)
    }
}
