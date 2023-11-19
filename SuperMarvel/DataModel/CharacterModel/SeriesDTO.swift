//
//  SeriesDTO.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 18/11/2023.
//

import Foundation

struct SeriesDTO: Codable, Equatable {
    
    let id: Int?
    let name, description: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let comics: Comics?
    let stories: Stories?
    var imageUrlPath: String {
        (thumbnail?.path ?? "") + "."
        + (thumbnail?.thumbnailExtension ?? "")
    }
    
    init(id: Int? = nil,
         name: String? = nil,
         description: String? = nil,
         modified: String? = nil,
         thumbnail: Thumbnail? = nil,
         comics: Comics? = nil,
         series: Comics? = nil,
         stories: Stories? = nil) {
        self.id = id
        self.name = name
        self.description = description
        self.modified = modified
        self.thumbnail = thumbnail
        self.comics = comics
        self.stories = stories
    }
   
    static func == (lhs: SeriesDTO, rhs: SeriesDTO) -> Bool {
        guard let lhsId = lhs.id else { return false }
        guard let rhsId = rhs.id else { return false }
        return lhsId == rhsId
    }
    
}

// MARK: - Comics
struct Comics: Codable {
    let items: [ComicsItem]?
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI: String?
    let name: String?
    var title: String {
        name ?? ""
    }
}

// MARK: - Stories
struct Stories: Codable {
    let items: [StoriesItem]?
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI: String?
    let name, type: String?
    var title: String {
        name ?? ""
    }
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String?
    let thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
