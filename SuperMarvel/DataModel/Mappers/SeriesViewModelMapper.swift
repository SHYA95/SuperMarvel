//
//  SeriesViewModelMapper.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 21/11/2023.
//

import Foundation

final class SeriesViewModelMapper {
    static let instance = SeriesViewModelMapper()
    private init() {}
    
    func mapToViewData(from series: MarvelResponse) -> MarvelResult {
        guard let firstResult = series.data?.results?.first else {
            return MarvelResult(
                id: 0,
                title: "No Title",
                description: "",
                resourceURI: "",
                startYear: 0,
                endYear: 0,
                rating: "No Rating",
                type: "",
                modified:"",
                thumbnail: MarvelThumbnail(path: "", extensionValue: "")
            )
        }
        
        
        return MarvelResult(
            id: firstResult.id ?? 0,
            title: firstResult.title ?? "No Title",
            description: firstResult.description ?? "",
            resourceURI: firstResult.resourceURI ?? "No available URLS",
            startYear: firstResult.startYear ?? 0,
            endYear: firstResult.endYear ?? 0,
            rating: firstResult.rating ?? "No Rating",
            type: firstResult.type ?? "",
            modified:firstResult.modified ?? "No available modification Date",
            thumbnail: firstResult.thumbnail ?? MarvelThumbnail(path: "", extensionValue: "")

        )
    }
}
