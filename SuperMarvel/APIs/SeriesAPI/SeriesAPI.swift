//
//  SeriesAPI.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import Moya

enum SeriesAPI {
    case getSeries(offset: Int)
}

extension SeriesAPI: TargetType {
    
    var path: String {
        switch self {
        case .getSeries: return UrlPath.characters.rawValue
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getSeries: return .get
        }
    }
    
    var parameters: [String: Any]? {
        var params: [String: Any] = defaultParameters ?? [:]
        switch self {
        case .getSeries(let offset):
            params["offset"] = offset
            params["limit"] = Configurations.pageSize
            return params
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getSeries: return URLEncoding.queryString
        }
    }
    
    var task: Task {
        if let parameters {
            return .requestParameters(parameters: parameters, encoding: parameterEncoding)
        } else {
            return .requestPlain
        }
    }
}
