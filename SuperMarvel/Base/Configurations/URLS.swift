//
//  URLS.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import Foundation

struct URLs {
    static var plainDomain: String {
        let urlDomainKey = "SERVER_URL"
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
            let dictionary = NSDictionary(contentsOfFile: path) {
            return dictionary[urlDomainKey] as? String ?? ""
        }
        return ""
    }

    static let versionPath = URLs.plainDomain + "/v1/public"
}
