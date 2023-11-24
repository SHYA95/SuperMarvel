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
    @IBOutlet weak var seriesType: UILabel!
    @IBOutlet weak var modifiedLable: UILabel!
    
    var selectedSeries: MarvelResult?
    var series: MarvelResponse?
    
    init(series: MarvelResult) {
        super.init(nibName: nil, bundle: nil)
        self.selectedSeries = series
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    private func setupData() {
            guard let series = selectedSeries else { return }

            seriesName.text = series.title
            modifiedLable.text = formattedModifiedDate(from: series.modified)
            descriptionData.text = seriesDescriptionText(from: series.description)
            ratingDate.text = seriesRatingText(from: series.rating)
            seriesType.text = seriesTypeText(from: series.type)
        if let startYear = series.startYear, let endYear = series.endYear {
                 releaseTime.text = "From: \(startYear) To: \(endYear)"
                 endTime.text = "\(endYear)"
             } else {
                 releaseTime.text = "Not Available"
             }

            loadImage(from: series.thumbnail?.path)
        }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        MovingTo.dismissMoviesViewController(on: self)
    }

// MARK: - Helper Methods

    private func formattedModifiedDate(from dateString: String?) -> String {
        guard let dateString = dateString,
              let modifiedDate = DateFormatter.iso8601Full.date(from: dateString) else {
            return "Modified: Not available"
        }

        return "Modified: \(DateFormatter.localizedString(from: modifiedDate, dateStyle: .medium, timeStyle: .short))"
    }

    private func seriesDescriptionText(from description: String?) -> String {
        return description?.isEmpty == false ? description! : "Description not available on our app. Visit our website for more details."
    }

    private func seriesRatingText(from rating: String?) -> String {
        return rating?.isEmpty == false ? rating! : "Rated A"
    }

    private func seriesTypeText(from type: String?) -> String {
        return type?.isEmpty == false ? type! : "General"
    }

    


    private func loadImage(from path: String?) {
        guard let imagePath = path, let seriesImageURL = URL(string: "\(imagePath).jpg") else {
            print("Invalid URL")
            return
        }

        detailsImageView.kf.setImage(with: seriesImageURL)
    }
}

