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
    }

    func showLoader() {
        loader?.startAnimating()
    }

    func hideLoader() {
        loader?.stopAnimating()
    }
}
