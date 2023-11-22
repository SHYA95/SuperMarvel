//
//  MoviesViewController.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var moviesSearchBar: UISearchBar!
    @IBOutlet weak var moviesTableView: UITableView!
    
    var viewModel: SeriesViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize your viewModel with the appropriate parameters
        viewModel = SeriesViewModel(seriesUC: DefaultSeriesUC(repository: SeriesRepository(seriesRequests: SeriesRequest())))

        // Now you can safely call getSeries
        viewModel.getSeries()
        
        setupUI()
        setupTableView()
    }

    
    private func setupUI() {
        moviesSearchBar.layer.cornerRadius = 15
        moviesSearchBar.layer.masksToBounds = true
        moviesSearchBar.layer.borderColor = UIColor.red.cgColor
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
    private func setupTableView() {
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.register(UINib(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: MoviesTableViewCell.identifier)
        moviesTableView.tableFooterView = UIView()
        moviesTableView.backgroundColor = .black
    }
    
    
}
// MARK: - UITableViewDataSource

extension MoviesViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.seriesCount
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier, for: indexPath) as? MoviesTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MoviesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8.0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
}

// MARK: - UISearchBarDelegate

extension MoviesViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Implement search functionality here
        // Example:
        // viewModel.searchMovies(query: searchText) { [weak self] movies in
        //     self?.movies = movies
        //     self?.moviesTableView.reloadData()
        // }
    }
}
