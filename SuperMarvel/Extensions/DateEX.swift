//
//  DateEX.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 24/11/2023.
//

import Foundation
extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
}
