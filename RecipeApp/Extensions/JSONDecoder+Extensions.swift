//
//  JSONDecoder+Extensions.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-05.
//

import Foundation

extension JSONDecoder.DateDecodingStrategy {
    static var iso8601Miliseconds: JSONDecoder.DateDecodingStrategy {
        return .custom({ decoder -> Date in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            let date = dateString.convertToCompleteDate() ?? dateString.ISO8601Date

            if let date = date {
                return date
            }

            throw DateError.invalidDate
        })
    }
}
