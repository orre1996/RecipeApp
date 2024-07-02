//
//  Font+Extensions.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import SwiftUI

extension Font {
    static func body(size: CGFloat) -> Font {
        return .system(size: UIFontMetrics.default.scaledValue(for: size), weight: .regular)
    }

    static func header(size: CGFloat) -> Font {
        return .system(size: UIFontMetrics.default.scaledValue(for: size), weight: .bold)
    }
}
