//
//  CharacterModel.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import Foundation

struct SeriesModel {
    let id: Int
    let title: String
    let description: String
    let resourceURI: String
    let startYear: Int
    let endYear: Int
    let rating: String
    let modified: String
    let image: String
    let comics: [ComicsItem]
    let stories: [StoriesItem]
}
