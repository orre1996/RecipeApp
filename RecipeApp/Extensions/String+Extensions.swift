//
//  String+Extensions.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import Foundation

extension String {
    static func emptyString(length: Int) -> String {
        return (0..<length).map({ _ in "0" }).joined()
    }
}
