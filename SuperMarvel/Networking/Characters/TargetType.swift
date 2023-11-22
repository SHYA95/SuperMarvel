//
//  TargetType.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import Moya
import Foundation

protocol MarvelAPI: TargetType {
    var publicKey: String { get }
    var privateKey: String { get }
}

extension MarvelAPI {
    var baseURL: URL {
        return MarvelURLs.baseURL
    }

    var headers: [String: String]? {
        let headers = [
            "accept": "application/json",
            "Content-Type": "application/json"
        ]
        return headers
    }

    var parameters: [String: Any]? {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(string: ts + privateKey + publicKey).lowercased()
        return [
            "apikey": publicKey,
            "ts": ts,
            "hash": hash
        ]
    }
}
