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

    var ISO8601Date: Date? {
        return ISO8601DateFormatter().date(from: self)
    }

    func convertToCompleteDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:s.SZ"

        return dateFormatter.date(from: self)
    }
}
