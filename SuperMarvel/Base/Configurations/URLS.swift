//
//  URLS.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import Foundation


struct URLs {
    static var plainDomain: String {
        guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
              let dictionary = NSDictionary(contentsOfFile: path),
              let serverURL = dictionary["SERVER_URL"] as? String else {
                  fatalError("Invalid or missing SERVER_URL in Info.plist")
              }
        return serverURL
    }

    static let versionPath = "https://" + URLs.plainDomain + "/v1/public"
}
