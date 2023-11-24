//
//  MoviesViewController.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import UIKit
import NVActivityIndicatorView

class MoviesViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var moviesSearchBar: UISearchBar!
    @IBOutlet weak var moviesTableView: UITableView!
    
    // MARK: - Properties
    
    var viewModel: SeriesViewModelProtocol!
    var didSelectMovieClosure: ((MarvelResult) -> Void)?
    private var loader: NVActivityIndicatorView?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLoaderAndViewModel()
        setupViewModelObservers()
        setupTableView()
        loadSeriesData()
    }
    
    private func setupLoaderAndViewModel() {
        loader = setupLoader()
        viewModel = SeriesViewModel(seriesUC: DefaultSeriesUseCase(repository: SeriesRepository(seriesRequests: SeriesRequest())))
    }
    
    private func setupViewModelObservers() {
        viewModel.showLoaderCallback = { [weak self] in
            self?.showLoaderIfNeeded()
        }

        viewModel.hideLoaderCallback = { [weak self] in
            self?.hideLoaderIfNeeded()
        }
        
        viewModel.dataUpdated = { [weak self] in
            self?.reloadTableViewAndHideLoader()
        }

        viewModel.shouldReloadCallback = { [weak self] in
            self?.reloadTableViewAndHideLoader()
        }

        viewModel.shouldStopRefresherCallback = { [weak self] in
            self?.hideLoaderIfNeeded()
        }

        viewModel.showErrorMessageCallback = { [weak self] errorMessage in
            self?.hideLoaderIfNeeded()
        }
    }
    
    // MARK: - Data Loading
    
    private func loadSeriesData() {
        showLoaderIfNeeded()
        viewModel.getSeries()
    }
    
    // MARK: - UI Updates
    
    private func showLoaderIfNeeded() {
        if let loader = loader {
            showLoader(loader)
        }
    }
    
    private func hideLoaderIfNeeded() {
        if let loader = loader {
            hideLoader(loader)
        }
    }
    
    private func reloadTableViewAndHideLoader() {
        hideLoaderIfNeeded()
        moviesTableView.reloadData()
    }
    
    // MARK: - Table View
    
    private func setupTableView() {
        moviesSearchBar.delegate = self
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
        viewModel.configure(cell: cell, index: indexPath.section)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedSeries = viewModel.getSelectedSeries(at: indexPath.section) else {
            return
        }
        MovingTo.movieDetailsViewController(on: self, selectedSeries: selectedSeries)
    }
}

