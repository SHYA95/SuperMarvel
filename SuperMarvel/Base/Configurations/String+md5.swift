//
//  String+md5.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 19/11/2023.
//

import UIKit
import CryptoKit

let publicKey = "0aad0a575419bbd9e7e6a7777ef1b446"
let privateKey = "6684e4964bfd09e2cebd57f30607904015e193ee"

//let publicKey = Configurations.getValue(for: "Public_Key")
//let privateKey = Configurations.getValue(for: "Private_Key")
//

//MARK: - Get MD5 Method
func MD5(string: String) -> String {
    let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
    
    return digest.map {
        String(format: "%02hhx", $0)
    }.joined()
    
}

