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
    var didSelectMovieClosure: ((MarvelResult) -> Void)?
    private var loader: NVActivityIndicatorView?
    
    func setupLoader() {
            let loaderSize = CGSize(width: 50, height: 50)
            let loaderFrame = CGRect(x: (view.bounds.width - loaderSize.width) / 2,
                                     y: (view.bounds.height - loaderSize.height) / 2,
                                     width: loaderSize.width,
                                     height: loaderSize.height)

            loader = NVActivityIndicatorView(frame: loaderFrame, type: .ballClipRotateMultiple, color: .white, padding: 20.0)
            loader?.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            loader?.layer.cornerRadius = 5.0
            loader?.isHidden = true
            view.addSubview(loader!)
        }


    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = SeriesViewModel(seriesUC: DefaultSeriesUseCase(repository: SeriesRepository(seriesRequests: SeriesRequest())))
        setupLoader()
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
    func reloadDataOnBack() {
        viewModel.getSeries()
        moviesTableView.reloadData()
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
    
    // Inside MoviesViewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedSeries = viewModel.getSelectedSeries(at: indexPath.section) else {
            return
        }
        MovingTo.movieDetailsViewController(on: self, selectedSeries: selectedSeries)
    }
}
