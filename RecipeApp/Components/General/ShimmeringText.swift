//
//  ShimmeringImage.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import SwiftUI

struct ShimmeringText: View {
    let text: String
    let font: Font
    let color: Color
    let downloading: Bool

    @State var show = false

    // MARK: - Body

    var body: some View {
        ZStack {
            Text(text)
                .font(font)
                .redacted(reason: downloading ? .placeholder : [])
                .foregroundColor(downloading ? .gray.opacity(0.15) : color)

            if downloading {
                shimmeringText
            }
        }
    }

    private var shimmeringText: some View {
        Text(text)
            .font(font)
            .redacted(reason: downloading ? .placeholder : [])
            .foregroundColor(.gray.opacity(0.15))
            .cornerRadius(4)
            .mask(
                Capsule()
                    .fill(LinearGradient(gradient: .init(colors: [.clear, .black, .clear]), startPoint: .top, endPoint: .bottom))
                    .rotationEffect(.init(degrees: 30))
                    .offset(x: show ? 360 : -360)
            )
            .animation(Animation.linear(duration: 2), value: show)
            .onAppear {
                show.toggle()

                Timer.scheduledTimer(withTimeInterval: 2.5, repeats: true, block: { timer in
                    if downloading {
                        show.toggle()
                    } else {
                        timer.invalidate()
                    }
                })
            }
    }
}

#Preview {
    ShimmeringText(text: .emptyString(length: 50),
                   font: .header(size: 16),
                   color: .cardTextColor,
                   downloading: true)
}
