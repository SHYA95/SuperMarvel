//
//  MarvelResponse.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 18/11/2023.
//


import Foundation


struct MarvelData: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [MarvelResult]?
}

struct MarvelResult: Codable {
    let id: Int?
    let title: String?
    let description: String?
    let resourceURI: String?
    let startYear: Int?
    let endYear: Int?
    let rating: String?
    let type: String?
    let modified: String?
    let thumbnail: MarvelThumbnail?
}

struct MarvelURL: Codable {
    let type: String?
    let url: String?
}

struct MarvelThumbnail: Codable {
    let path: String?
    let extensionValue: String?
    
    var fullPath: String? {
        return path.map { $0 + "." + (extensionValue ?? "") }
    }
}

struct MarvelStoryItem: Codable {
    let resourceURI: String?
    let name: String?
    let type: String?
}
