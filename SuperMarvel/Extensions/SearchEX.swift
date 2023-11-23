//
//  SearchEX.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 22/11/2023.
//

import UIKit

extension MoviesViewController {
    func setupUI() {
        moviesSearchBar.layer.cornerRadius = 15
        moviesSearchBar.layer.masksToBounds = true
        moviesSearchBar.layer.borderColor = UIColor.white.cgColor
        moviesSearchBar.layer.borderWidth = 1.0

        if let textField = moviesSearchBar.value(forKey: "searchField") as? UITextField {
            textField.textColor = .white
            textField.backgroundColor = .clear
            textField.layer.cornerRadius = 10.5
            textField.layer.masksToBounds = true
            textField.layer.borderWidth = 1.0

            if let placeholderLabel = textField.value(forKey: "placeholderLabel") as? UILabel {
                placeholderLabel.textColor = .white
            }
        }

       
    }
}
