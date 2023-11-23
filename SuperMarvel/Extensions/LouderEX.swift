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
    func setupLoader() {
        loader = NVActivityIndicatorView(frame: .zero, type: .ballClipRotate, color: .white, padding: nil)
        loader?.center = view.center
        view.addSubview(loader!)
//        loader?.frame = loaderFrame
        loader?.type = .ballClipRotateMultiple
        loader?.color = .white
        loader?.padding = 20.0
        loader?.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        loader?.layer.cornerRadius = 5.0
        loader?.isHidden = true
    
    }

    func showLoader() {
        loader?.startAnimating()
    }

    func hideLoader() {
        loader?.stopAnimating()
    }
}



