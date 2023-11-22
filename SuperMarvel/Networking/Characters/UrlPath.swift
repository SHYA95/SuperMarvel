//
//  UrlPath.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

//import Foundation
//
//struct MarvelURLs {
//    static let baseURL = URL(string: "https://gateway.marvel.com/v1/public")!
//
//    static var Series: String {
//      return "/series?offset=\(offset)&ts=\(timeStamp)&limit=\(limit)&apikey=\(publicKey)&hash=\(hashKey)"
//
//    }
//
//    static func Series(seriesId: Int) -> String {
//        return "/series\(seriesId)"
//    }
//}
//
import Foundation

//struct MarvelURLs {
//    static let baseURL = URL(string: "https://gateway.marvel.com:443/v1/public/")!
//    static let offset = 0
//    static let timeStamp = "yourTimeStampValue"
//    static let limit = 15
//
//
//    static var Series: String {
//        let ts = Int(Date().timeIntervalSince1970)
//        let hash = MD5(string: "\(ts)\(privateKey)\(publicKey)")
//        return "series?offset=\(offset)&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
//    }
//
//    static func Series(seriesId: Int) -> String {
//        return "series/\(seriesId)"
//    }
//}

//import CryptoKit
//
//struct MarvelURLs {
//    static let baseURL = URL(string: "https://gateway.marvel.com/v1/public/")!
//
//    static let limit = 15
//
//    static var Series: String {
//        let ts = Int(Date().timeIntervalSince1970)
//        let hash = MD5(string: "\(ts)\(privateKey)\(publicKey)").lowercased()
//
//        let seriesURL = "series"
//
//        return "\(seriesURL)?ts=\(ts)&apikey=\(publicKey)&hash=\(hash)&"
//    }
//
//
//
//
//    static func Series(seriesId: Int) -> String {
//        return "series/\(seriesId)"
//    }
//}
import Foundation

struct MarvelURLs {
    static let baseURL = URL(string: "https://gateway.marvel.com/v1/public/")!

    static var Series: URLComponents {
        var components = URLComponents(url: baseURL.appendingPathComponent("series"), resolvingAgainstBaseURL: true)!
        components.queryItems = defaultQueryItems
        return components
    }

    static func Series(seriesId: Int) -> URL {
        var components = URLComponents(url: baseURL.appendingPathComponent("series/\(seriesId)"), resolvingAgainstBaseURL: true)!
        components.queryItems = defaultQueryItems
        return components.url!
    }

    private static var defaultQueryItems: [URLQueryItem] {
        let ts = String(Int(Date().timeIntervalSince1970))
        let hash = MD5(string: "\(ts)\(privateKey)\(publicKey)").lowercased()
        return [
            URLQueryItem(name: "ts", value: ts),
            URLQueryItem(name: "apikey", value: publicKey),
            URLQueryItem(name: "hash", value: hash)
        ]
    }
}
