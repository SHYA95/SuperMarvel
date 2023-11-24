//
//  LouderEX.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 22/11/2023.
//

import UIKit
import NVActivityIndicatorView

private var loader: NVActivityIndicatorView?

extension UIViewController {
    func setupLoader() -> NVActivityIndicatorView {
        let loaderSize = CGSize(width: 85, height: 85) 
        let loaderFrame = CGRect(x: (view.bounds.width - loaderSize.width) / 2,
                                 y: (view.bounds.height - loaderSize.height) / 2,
                                 width: loaderSize.width,
                                 height: loaderSize.height)
        
        let loader = NVActivityIndicatorView(frame: loaderFrame, type: .lineScalePulseOut, color: UIColor.systemRed, padding: 20.0)
        loader.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        loader.layer.cornerRadius = 5.0
        loader.isHidden = true
        view.addSubview(loader)
        return loader
    }

    func showLoader(_ loader: NVActivityIndicatorView) {
        loader.startAnimating()
    }

    func hideLoader(_ loader: NVActivityIndicatorView) {
        loader.stopAnimating()
    }
}
