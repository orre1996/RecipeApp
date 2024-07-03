//
//  ShimmeringText.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import SwiftUI

struct ShimmeringImage: View {
    let imageUrl: String?
    var scaledToFit = true

    @State private var show = true
    @State private var showShimmer: Bool = true
    
    var radius: CGFloat = 8
    var width: CGFloat?
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl ?? "")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .if(scaledToFit) { view in
                        view.scaledToFit()
                    }
                    .if(!scaledToFit) { view in
                        view.scaledToFill()
                    }
                    .onAppear {
                        showShimmer = false
                    }
                    .onDisappear {
                        showShimmer = true
                    }
            } else {
                placeholderImage
            }
        }
    }
    
    private var placeholderImage: some View {
        ZStack {
            Color.shimmerColor
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Color.shimmerColor
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .mask(
                    Capsule()
                        .fill(LinearGradient(gradient: .init(colors: [.clear, .cardTextColor, .clear]), startPoint: .top, endPoint: .bottom))
                        .rotationEffect(.init(degrees: 30))
                        .offset(x: show ? 400 : -400)
                )
                .animation(.linear(duration: 2), value: show)
                .onAppear {
                    guard showShimmer else { return }

                    show.toggle()

                    Timer.scheduledTimer(withTimeInterval: 2.5, repeats: true, block: { timer in
                        if showShimmer {
                            show.toggle()
                        } else {
                            timer.invalidate()
                        }
                    })
                }
        }
    }
}

#Preview {
    ShimmeringImage(imageUrl: nil)
}
