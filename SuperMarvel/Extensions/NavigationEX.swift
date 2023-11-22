//
//  NavigationEX.swift
//  SuperMarvel
//
//  Created by Shrouk Yasser on 22/11/2023.
//


import UIKit
extension UIViewController {
    func reloadToSelectedPage(to vc: UIViewController) {
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else {
            return
        }
        window.rootViewController = vc
    }
}
