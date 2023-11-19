//
//  MoviesViewModel.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 18/11/2023.
//
import Foundation
import UIKit

protocol SeriesViewModelProtocol {
    func getSeries()
    var seriesCount: Int { get }
    var totalSeriesCount: Int { get }
    var shouldReloadCallback: (() -> Void)? { get set }
    var shouldStopRefresherCallback: (() -> Void)? { get set }
    var showErrorMessageCallback: ((String) -> Void)? { get set }
    var isLoading: Bool { get }
    var isEmptyState: Bool { get }
    func didPullToRefresh()
    func configure(cell: MoviesTableViewCellProtocol, index: Int)
    func didSelectSeries(index: Int) -> SeriesModel
    func getMoreSeries()
}

class SeriesViewModel: SeriesViewModelProtocol {
    func configure(cell: MoviesTableViewCellProtocol, index: Int) {
        let series = series[index]
        cell.configureCell(series: series)
    }
    

    private let seriesUC: SeriesUC
    private var series: [SeriesModel] = []

    private var offset = 0
    var totalSeriesCount: Int = 0

    var shouldReloadCallback: (() -> Void)?
    var shouldStopRefresherCallback: (() -> Void)?
    var showErrorMessageCallback: ((String) -> Void)?

    private(set) var isLoading: Bool = false
    private(set) var isEmptyState: Bool = false

    init(seriesUC: SeriesUC) {
        self.seriesUC = seriesUC
    }

    func getSeries() {
        isLoading = true
        let params = SeriesParams(offset: offset)

        seriesUC.execute(with: params) { [weak self] result in
            guard let self = self else { return }

            self.isLoading = false

            switch result {
            case .success(let response):
                self.totalSeriesCount = response.data?.total ?? 0
                let series = SeriesMapper.instance.mapToSeries(series: response.data?.results)
                print(series)

                self.isEmptyState = series.isEmpty
                self.series.append(contentsOf: series)
                self.shouldReloadCallback?()
            case .failure(let error):
                self.isEmptyState = true
                self.showErrorMessageCallback?(error.localizedDescription)
                print(error)
            }

            self.shouldStopRefresherCallback?()
            shouldReloadCallback?()
        }
    }

    var seriesCount: Int {
        series.count
    }

    func didSelectSeries(index: Int) -> SeriesModel {
        series[index]
    }

    func getMoreSeries() {
        offset += Configurations.pageSize
        getSeries()
    }

    func didPullToRefresh() {
        offset = 0
        series = []
        shouldReloadCallback?()
        getSeries()
    }
}
