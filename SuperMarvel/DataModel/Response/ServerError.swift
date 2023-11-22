//
//  ServerError.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import Foundation

enum ServerError: Error, Decodable {
    case network
    case serialization
    case invalidURL
    case invalidResponse
    case decodingFailed
    case encodingFailed
    case custom(message: String)

    var localizedDescription: String {
        switch self {
        case .network:
            return "Network error occurred."
        case .serialization:
            return "Serialization error occurred."
        case .invalidURL:
            return "Invalid URL."
        case .invalidResponse:
            return "Invalid response received."
        case .decodingFailed:
            return "Decoding response data failed."
        case .encodingFailed:
            return "Encoding request parameters failed."
        case .custom(let message):
            return message
        }
    }
}
