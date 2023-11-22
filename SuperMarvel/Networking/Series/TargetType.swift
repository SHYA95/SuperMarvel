//
//  TargetType.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import Moya
import Foundation

extension TargetType {
    
    var defaultParameters: [String: Any]? {
        guard
            let publicKey = Bundle.main.infoDictionary?["MARVEL_PUBLIC_KEY"] as? String,
            let privateKey = Bundle.main.infoDictionary?["MARVEL_PRIVATE_KEY"] as? String,
            let timestamp = Bundle.main.infoDictionary?["MARVEL_TIMESTAMP"] as? String
        else {
            fatalError("Missing configuration values in Info.plist")
        }

        return [
            "apikey": publicKey,
            "ts": timestamp,
            "hash": MD5(string: "\(timestamp)\(privateKey)\(publicKey)").lowercased()
        ]
    }
    
    var baseURL: URL {
        guard let url = URL(string: URLs.versionPath) else {
            fatalError("Invalid URL in configuration")
        }
        return url
    }
    
    var headers: [String: String]? {
        let headers = [
            "accept": "application/json",
            "Content-Type": "application/json"
        ]
        return headers
    }
    
    var parameters: [String: Any]? {
        defaultParameters
    }
}

extension Moya.Response {
    var isSuccess: Bool {
        (200 ... 299) ~= statusCode
    }
}
