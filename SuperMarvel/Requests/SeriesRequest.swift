//
//  SeriesRequest.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import Foundation
import Moya

protocol SeriesRequestProtocol {
    func getSeries(offset: Int, completion: @escaping (Result<MarvelResponse, ServerError>) -> Void) -> Cancellable
}



final class SeriesRequest: BaseRequest<SeriesAPI>, SeriesRequestProtocol {
    func getSeries(offset: Int, completion: @escaping (Result<MarvelResponse, ServerError>) -> Void) -> Cancellable {
        return moyaProvide.request(.getSeries(offset: offset), type: MarvelResponse.self) { result in
            switch result {
            case .success(let seriesDTO):
                completion(.success(seriesDTO))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
