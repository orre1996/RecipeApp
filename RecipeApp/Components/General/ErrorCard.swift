//
//  ErrorCard.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import SwiftUI

struct ErrorCard: View {
    var body: some View {
        Text("Couldn't download data at this moment.\nPlease try again later.")
            .font(.body(size: 16))
            .foregroundStyle(Color.cardTextColor)
            .padding(16)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .cardBackground()
    }
}

#Preview {
    ErrorCard()
}
