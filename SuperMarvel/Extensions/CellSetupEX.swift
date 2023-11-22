//
//  CellSetup.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 22/11/2023.
//

import UIKit

extension UIView {
    func setupCellUI() {
        backgroundColor = .black
        layer.cornerRadius = 15
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.darkGray.cgColor
        layer.masksToBounds = false

        // Add a subtle shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
    }
}
