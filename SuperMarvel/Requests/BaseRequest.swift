//
//  BaseRequest.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 17/11/2023.
//

import Moya

class BaseRequest<T: TargetType> {
    
    lazy var moyaProvide: MoyaProvider<T> = {
        return MoyaProvider<T>(plugins: [NetworkLoggerPlugin()])
    }()
    
}
