//
//  searchBarEX.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 22/11/2023.
//

import UIKit

// MARK: - UISearchBarDelegate

extension MoviesViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        viewModel.searchSeries(query: searchText)
    }
}

