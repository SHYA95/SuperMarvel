//
//  CharacterRequest.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//



import Foundation
import Moya

protocol SeriesRequestProtocol {
    func getSeries(offset: Int, completion: @escaping SeriesResults)
}

final class SeriesRequest: BaseRequest<SeriesAPI>, SeriesRequestProtocol {
    func getSeries(offset: Int, completion: @escaping SeriesResults) {
        moyaProvider.request(.getSeries(offset: offset)) { result in
            switch result {
            case .success(let response):
                do {
                    let data = try response.map(Data.self)
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Response JSON: \(json)")

                    let serverResponse = try JSONDecoder().decode(MarvelBaseResponseModel<SeriesDTO>.self, from: data)
                    completion(.success(serverResponse))
                } catch let error {
                    print("Error decoding response: \(error)")
                    print("Raw response data: \(String(data: response.data, encoding: .utf8) ?? "N/A")")
                    completion(.failure(ServerError.serialization))
                }

            case .failure(let error):
                print("Network request failed: \(error)")
                completion(.failure(ServerError.network))
            }
        }
    }
}
