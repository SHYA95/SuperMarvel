//
//  MoyaProvider.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import Moya
import Foundation

extension MoyaProvider {
    func request<T: Codable>(_ target: Target, type: T.Type, completion: @escaping (Result<T, ServerError>) -> Void) -> Cancellable {
        return self.request(target) { result in
            switch result {
            case .success(let response):
                if (200 ... 299) ~= response.statusCode {
                    do {
                        let serverResponse = try JSONDecoder().decode(type, from: response.data)
                        completion(.success(serverResponse))
                    } catch {
                        completion(.failure(ServerError.serialization))
                    }
                } else {
                    do {
                        let serverError = try JSONDecoder().decode(ServerError.self, from: response.data)
                        completion(.failure(ServerError.custom(message: serverError.localizedDescription)))
                    } catch {
                        completion(.failure(ServerError.serialization))
                    }
                }
            case .failure(_):
                completion(.failure(ServerError.network))
            }
        }
    }
}
