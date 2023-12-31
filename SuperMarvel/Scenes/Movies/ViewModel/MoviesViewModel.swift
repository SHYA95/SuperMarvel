import Foundation

protocol SeriesViewModelProtocol {
    var seriesCount: Int { get }
    var totalSeriesCount: Int { get }
    var shouldReloadCallback: (() -> Void)? { get set }
    var shouldStopRefresherCallback: (() -> Void)? { get set }
    var showErrorMessageCallback: ((String) -> Void)? { get set }
    var showLoaderCallback: (() -> Void)? { get set }
    var hideLoaderCallback: (() -> Void)? { get set }
    var dataUpdated: (() -> Void)? { get set }
    var isLoading: Bool { get }
    var isEmptyState: Bool { get }

    func getSeries()
    func searchSeries(query: String)
    func didPullToRefresh()
    func configure(cell: MoviesTableViewCellProtocol, index: Int)
    func getMoreSeries()
    func getSelectedSeries(at index: Int) -> MarvelResult?
    func didSelectSeries(at index: Int)
}

class SeriesViewModel: SeriesViewModelProtocol {
    var showLoaderCallback: (() -> Void)?
    var hideLoaderCallback: (() -> Void)?

    private let seriesUC: SeriesUseCase
    private var series: [MarvelResponse] = []

    var dataUpdated: (() -> Void)?
    private var offset = 0
    var totalSeriesCount: Int = 0
    var shouldStopRefresherCallback: (() -> Void)?
    var showErrorMessageCallback: ((String) -> Void)?

    private(set) var isLoading: Bool = false
    private(set) var isEmptyState: Bool = false
    var shouldReloadCallback: (() -> Void)? {
        didSet {
            print("shouldReloadCallback is set")
        }
    }

    init(seriesUC: SeriesUseCase) {
        self.seriesUC = seriesUC
    }

    // MARK: - Data Operations

    func getSeries() {
        showLoaderCallback?()

        isLoading = true
        let params = SeriesParams(offset: offset)

        seriesUC.execute(with: params) { [weak self] result in
            guard let self = self else { return }

            defer {
                self.isLoading = false
                self.hideLoaderCallback?()
            }

            switch result {
            case .success(let response):
                self.handleSuccessResponse(response)

            case .failure(let error):
                self.handleFailureResponse(error)
            }

            self.shouldStopRefresherCallback?()
        }
    }

    private func handleSuccessResponse(_ response: MarvelResponse) {
        if let data = response.data {
            self.totalSeriesCount = data.total ?? 0

            if let results = data.results {
                let series = SeriesModelMapper.instance.mapToMarvelResponses(from: results)
                self.series.append(contentsOf: series)
                print("Received \(series.count) new items. Total items: \(self.series.count)")
                self.dataUpdated?()
            } else {
                print("No results")
            }
        }
    }

    private func handleFailureResponse(_ error: Error) {
        self.isEmptyState = true
        self.showErrorMessageCallback?(error.localizedDescription)
        print("Error: \(error)")
    }

    // MARK: - Search Operations

    func searchSeries(query: String) {
        filteredSeries = series.filter { $0.data?.results?.first?.title?.localizedCaseInsensitiveContains(query) == true }
        dataUpdated?()
    }

    var filteredSeries: [MarvelResponse] = []

    // MARK: - Configuration

    var seriesCount: Int {
        return filteredSeries.isEmpty ? series.count : filteredSeries.count
    }

    func configure(cell: MoviesTableViewCellProtocol, index: Int) {
        guard index < seriesCount else { return }
        let seriesItem = filteredSeries.isEmpty ? series[index] : filteredSeries[index]
        let viewData = SeriesViewModelMapper.instance.mapToViewData(from: seriesItem)
        cell.configureCell(series: viewData)
    }

    // MARK: - Selection and Navigation

    func didSelectSeries(at index: Int) {
        print("Did select series at index \(index)")
    }

    func getMoreSeries() {
        guard !isLoading else {
            return
        }
        guard seriesCount < totalSeriesCount else {
            return
        }

        isLoading = true
        offset += Configurations.pageSize
        print("offsets:\(offset)")
        getSeries()
    }

    func didPullToRefresh() {
        offset = 0
        series = []
        shouldReloadCallback?()
        getSeries()
    }

    func getSelectedSeries(at index: Int) -> MarvelResult? {
        guard index < series.count else { return nil }
        guard let results = series[index].data?.results else { return nil }
        return results.isEmpty ? nil : results[0]
    }
}
