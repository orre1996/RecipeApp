//
//  DynamicCodingKeys.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import Foundation

struct DynamicCodingKeys: CodingKey {
    var stringValue: String
    var intValue: Int? { return nil }
    init?(stringValue: String) { self.stringValue = stringValue }
    init?(intValue: Int) { return nil }
}
