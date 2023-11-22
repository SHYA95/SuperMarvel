//
//  BaseResponseModel.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import Foundation

typealias CodableEquable = Equatable & Codable

struct MarvelBaseResponseModel<T: CodableEquable>: Equatable, Codable {
    
    let code: Int?
    let status: String?
    let data: MarvelResponseDataModel<T>?
    
    static func == (leftResponse: MarvelBaseResponseModel<T>, rightResponse: MarvelBaseResponseModel<T>) -> Bool {
        leftResponse.code == rightResponse.code &&
        leftResponse.data == rightResponse.data &&
        leftResponse.status == rightResponse.status
    }
}

struct MarvelResponseDataModel<T: CodableEquable>: Equatable, Codable {
    let offset, limit, total, count: Int?
    let results: [T]?
    
    static func == (leftData: MarvelResponseDataModel<T>, rightData: MarvelResponseDataModel<T>) -> Bool {
        leftData.offset == rightData.offset &&
        leftData.limit == rightData.limit &&
        leftData.count == rightData.total &&
        leftData.count == rightData.count &&
        leftData.results == rightData.results
    }
}
