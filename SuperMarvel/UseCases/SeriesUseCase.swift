//
//  CharactersUseCase.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import Foundation

struct SeriesParams {
    let offset: Int
}

protocol SeriesUseCase {
    func execute(with params: SeriesParams, completion: @escaping SeriesResults)
}

class DefaultSeriesUseCase: SeriesUseCase {
    private var repository: SeriesRepositoryProtocol

    init(repository: SeriesRepositoryProtocol) {
        self.repository = repository
    }

    func execute(with params: SeriesParams, completion: @escaping SeriesResults) {
        repository.getSeries(offset: params.offset, completion: completion)
    }
}

