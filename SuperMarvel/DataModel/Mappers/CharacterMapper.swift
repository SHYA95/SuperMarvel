//
//  CharacterMapper.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import Foundation

final class SeriesMapper {
    static let instance = SeriesMapper()
    private init() {}

    func mapToSeries(series: [SeriesDTO]?) -> [SeriesModel] {
        series?.compactMap { seriesDTO in
            SeriesModel(id: seriesDTO.id ?? 0,
                        title: seriesDTO.name ?? "",
                        description: seriesDTO.description ?? "",
                        resourceURI: "",
                        startYear: 0,
                        endYear: 0,
                        rating: "",
                        modified: seriesDTO.modified ?? "",
                        image: seriesDTO.imageUrlPath,
                        comics: seriesDTO.comics?.items ?? [],
                        stories: seriesDTO.stories?.items ?? [])
        } ?? []
    }
}
