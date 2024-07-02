//
//  UIApplication+Extensions.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import UIKit

extension UIApplication {
    func getWindow() -> UIWindow? {
        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return nil }
        guard let firstWindow = firstScene.windows.first else { return nil }

        return firstWindow
    }
}
