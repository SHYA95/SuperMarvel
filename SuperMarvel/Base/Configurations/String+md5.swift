//
//  String+md5.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 19/11/2023.
//

import UIKit
import CryptoKit


//MARK: - Get MD5 Method
func MD5(string: String) -> String {
    let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
    
    return digest.map {
        String(format: "%02hhx", $0)
    }.joined()
    
}

