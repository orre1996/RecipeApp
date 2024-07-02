//
//  UIWindow+Extensions.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import UIKit

extension UIWindow {
    static var key: UIWindow? {
        return UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }

    static var isLandscape: Bool {
        return UIApplication.shared.getWindow()?
            .windowScene?
            .interfaceOrientation
            .isLandscape ?? false
    }
}
