////
////  CharacterAPI.swift
////  SuperMarvel
////
////  Created by Shrouk Yasser on 17/11/2023.
////
//
//import Moya
//import Foundation
//
//enum SeriesAPI {
//    case getSeries(offset: Int)
//    case getSeriesDetails(id: Int)
//}
//
//extension SeriesAPI: TargetType {
//    var baseURL: URL {
//        return MarvelURLs.baseURL
//    }
//
//    var path: String {
//        switch self {
//        case .getSeries:
//            return MarvelURLs.Series
//        case .getSeriesDetails(let id):
//            return MarvelURLs.Series(seriesId: id)
//        }
//    }
//
//    var method: Moya.Method {
//        return .get
//
//    }
//
//    var task: Task {
//        switch self {
//        case .getSeries(let offset):
//            return .requestParameters(parameters: ["offset": offset], encoding: URLEncoding.default)
//        case .getSeriesDetails:
//            return .requestPlain
//        }
//    }
//
//    var headers: [String: String]? {
//        return ["Content-Type": "application/json"]
//    }
//}
//

import Foundation
import Moya

enum SeriesAPI {
    case getSeries(offset: Int)
    case getSeriesDetails(id: Int)
}

extension SeriesAPI: TargetType {
    var baseURL: URL {
        return MarvelURLs.baseURL
    }

    var path: String {
        switch self {
        case .getSeries:
            return MarvelURLs.Series
        case .getSeriesDetails(let id):
            return MarvelURLs.Series(seriesId: id)
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .getSeries(let offset):
            var urlComponents = URLComponents(string: MarvelURLs.Series)!
            urlComponents.queryItems = [
                URLQueryItem(name: "offset", value: String(offset))
                // Add other query items as needed
            ]
            return .requestPlain // For a GET request, query items are included in the URL
        case .getSeriesDetails:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
