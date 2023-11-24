//
//  searchBarEX.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 22/11/2023.
//

import UIKit

// MARK: - UISearchBarDelegate

extension MoviesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        handleSearchResults()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchSeries(query: searchText)
        handleSearchResults()
    }
    
    private func handleSearchResults() {
        if viewModel.isEmptyState {
            let message = "No matching items found."
            showNoResultsLabel(with: message)
            
        } else {
            hideNoResultsLabel()
        }
        moviesTableView.reloadData()
    }
    
    private func showNoResultsLabel(with message: String) {
        let label = UILabel()
        label.text = message
        label.textColor = .gray
        label.textAlignment = .center
        label.frame = CGRect(x: 0, y: 0, width: moviesTableView.bounds.width, height: moviesTableView.bounds.height)
        moviesTableView.tableFooterView = label
    }
    
    
    private func createNoResultsLabel(with message: String) {
        let label = UILabel()
        label.text = message
        label.textColor = .gray
        label.textAlignment = .center
        label.frame = CGRect(x: 0, y: 0, width: moviesTableView.bounds.width, height: moviesTableView.bounds.height)
        moviesTableView.tableFooterView = label
    }
    
    private func hideNoResultsLabel() {
        if moviesTableView.tableFooterView != nil {
            // Clear the existing label text or set it to an empty string
            if let existingLabel = moviesTableView.tableFooterView as? UILabel {
                existingLabel.text = "No search results found."
            }
        } else {
            
            createNoResultsLabel(with: "No search results found.")
        }
    }
}
