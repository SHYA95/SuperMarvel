//
//  CharacterRepository.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

// CharacterRepositoryProtocol.swift
import Foundation

protocol SeriesRepositoryProtocol: AnyObject {
    func getSeries(offset: Int, completion: @escaping SeriesResults)
}

final class SeriesRepository: NSObject, SeriesRepositoryProtocol {
    private let seriesRequests: SeriesRequestProtocol

    init(seriesRequests: SeriesRequestProtocol) {
        self.seriesRequests = seriesRequests
    }

    func getSeries(offset: Int, completion: @escaping SeriesResults) {
        seriesRequests.getSeries(offset: offset, completion: completion)
    }
}
