//
//  NavigationEX.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 22/11/2023.
//


import UIKit

struct MovingTo {
    static func presentMoviesViewController(on vc: UIViewController) {
        let moviesViewController = MoviesViewController(nibName: "MoviesViewController", bundle: nil)
        moviesViewController.modalPresentationStyle = .fullScreen
        vc.present(moviesViewController, animated: true, completion: nil)
    }

    static func dismissMoviesViewController(on vc: UIViewController) {
        vc.dismiss(animated: true, completion: nil)
    }

    static func movieDetailsViewController(on vc: UIViewController, selectedSeries: MarvelResult) {
        let page = MovieDetailsViewController(nibName: "MovieDetailsViewController", bundle: nil)
        page.selectedSeries = selectedSeries
        page.modalPresentationStyle = .fullScreen
        vc.present(page, animated: true, completion: nil)
    }
}
