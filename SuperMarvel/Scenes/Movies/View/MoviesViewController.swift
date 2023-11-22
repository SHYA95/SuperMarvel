//
//  MoviesViewController.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import UIKit
import NVActivityIndicatorView

class MoviesViewController: UIViewController {
    @IBOutlet weak var moviesSearchBar: UISearchBar!
    @IBOutlet weak var moviesTableView: UITableView!

    var viewModel: SeriesViewModelProtocol!
    private var loader: NVActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = SeriesViewModel(seriesUC: DefaultSeriesUseCase(repository: SeriesRepository(seriesRequests: SeriesRequest())))

        setupUI()
        setupViewModelObservers()
        setupTableView()
        scrollViewDidScroll(moviesTableView)

        DispatchQueue.main.async {
            self.showLoader()
            self.viewModel.getSeries()
        }
    }

    private func setupViewModelObservers() {
        viewModel.dataUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.hideLoader()
                self?.moviesTableView.reloadData()
            }
        }

        viewModel.shouldReloadCallback = { [weak self] in
            DispatchQueue.main.async {
                self?.hideLoader()
                self?.moviesTableView.reloadData()
            }
        }

        viewModel.shouldStopRefresherCallback = { [weak self] in
            DispatchQueue.main.async {
                self?.hideLoader()
            }
        }

        viewModel.showErrorMessageCallback = { [weak self] errorMessage in
            DispatchQueue.main.async {
                self?.hideLoader()
            }
        }
    }

    private func setupTableView() {
        // Assign the search bar delegate
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
        let detailsMoviesViewController = MovieDetailsViewController(series: selectedSeries)
        self.reloadToSelectedPage(to: detailsMoviesViewController)
    }
}

