//
//  CharacterDTO.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import Foundation



//struct CharacterDTO: Codable, Equatable {
//    let id: Int?
//    let name, description: String?
//    let modified: String?
//    let thumbnail: Thumbnail?
//    let comics, series, stories: ListContainer?
//
//    var imageUrlPath: String {
//        (thumbnail?.path ?? "") + "." + (thumbnail?.thumbnailExtension ?? "")
//    }
//
//    init(
//        id: Int? = nil,
//        name: String? = nil,
//        description: String? = nil,
//        modified: String? = nil,
//        thumbnail: Thumbnail? = nil,
//        comics: ListContainer? = nil,
//        series: ListContainer? = nil,
//        stories: ListContainer? = nil
//    ) {
//        self.id = id
//        self.name = name
//        self.description = description
//        self.modified = modified
//        self.thumbnail = thumbnail
//        self.comics = comics
//        self.series = series
//        self.stories = stories
//    }
//
//    static func == (lhs: CharacterDTO, rhs: CharacterDTO) -> Bool {
//        guard let lhsId = lhs.id else { return false }
//        guard let rhsId = rhs.id else { return false }
//        return lhsId == rhsId
//    }
//}
//
//struct Thumbnail: Codable {
//    let path: String?
//    let thumbnailExtension: String?
//
//    enum CodingKeys: String, CodingKey {
//        case path
//        case thumbnailExtension = "extension"
//    }
//}
//
//struct ListContainer: Codable {
//    let items: [Item]?
//}
//
//struct Item: Codable {
//    let resourceURI: String?
//    let name: String?
//    let type: String?
//
//    var title: String {
//        name ?? ""
//    }
//}
//import Foundation
//
//struct Url: Codable {
//    let type: String?
//    let url: String?
//}
//
////struct Image: Codable {
////    let path: String?
////    let thumbnailExtension: String?
////
////    enum CodingKeys: String, CodingKey {
////        case path
////        case thumbnailExtension = "extension"
////    }
////}
//
//
//struct ComicList: Codable {
//    let available: Int?
//    let collectionURI: String?
//    let items: [ComicSummary]?
//}
//
//struct StoryList: Codable {
//    let available: Int?
//    let collectionURI: String?
//    let items: [StorySummary]?
//}
//
//struct EventList: Codable {
//    let available: Int?
//    let collectionURI: String?
//    let items: [EventSummary]?
//}
//
//struct SeriesList: Codable {
//    let available: Int?
//    let collectionURI: String?
//    let items: [SeriesSummary]?
//}
//
//struct ComicSummary: Codable {
//    let resourceURI: String?
//    let name: String?
//}
//
//struct StorySummary: Codable {
//    let resourceURI: String?
//    let name, type: String?
//}
//
//struct EventSummary: Codable {
//    let resourceURI: String?
//    let name: String?
//}
//
//struct SeriesSummary: Codable {
//    let resourceURI: String?
//    let name: String?
//}
//
//struct Thumbnail: Codable {
//    let path: String?
//    let thumbnailExtension: String?
//
//    enum CodingKeys: String, CodingKey {
//        case path
//        case thumbnailExtension = "extension"
//    }
//}
//
//struct CharacterDTO: Codable, Equatable {
//    let id: Int?
//    let name, description: String?
//    let modified: String?
//    let thumbnail: Thumbnail?
//    let comics, series, stories: ListContainer?
//
//    var imageUrlPath: String {
//        (thumbnail?.path ?? "") + "." + (thumbnail?.thumbnailExtension ?? "")
//    }
//
//    init(
//        id: Int? = nil,
//        name: String? = nil,
//        description: String? = nil,
//        modified: String? = nil,
//        thumbnail: Thumbnail? = nil,
//        comics: ListContainer? = nil,
//        series: ListContainer? = nil,
//        stories: ListContainer? = nil
//    ) {
//        self.id = id
//        self.name = name
//        self.description = description
//        self.modified = modified
//        self.thumbnail = thumbnail
//        self.comics = comics
//        self.series = series
//        self.stories = stories
//    }
//
//    static func == (lhs: CharacterDTO, rhs: CharacterDTO) -> Bool {
//        guard let lhsId = lhs.id else { return false }
//        guard let rhsId = rhs.id else { return false }
//        return lhsId == rhsId
//    }
//}
//
//struct ListContainer: Codable {
//    let items: [Item]?
//}
//
//struct Item: Codable {
//    let resourceURI: String?
//    let name: String?
//    let type: String?
//
//    var title: String {
//        name ?? ""
//    }
//}
//
