//
//  Configurations.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 18/11/2023.
//

import Foundation

struct Configurations {
    static let pageSize = 15
    static let insetsWidth: CGFloat = 12
    static func getValue(for key: String) -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key) else { return "" }
        return value as! String
    }
    
}
