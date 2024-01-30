//
//  GameDetailView.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import SwiftUI

struct GameDetailView: View {
    @State var currentIndex: Int = 0

    var bottomBar: some View {
        HStack {
            Button {
                withAnimation(.easeInOut) {
                    print("left")
                    currentIndex = max(0, currentIndex-1)
                }

            } label: {
                Text("left")
            }
            Spacer()
            Button {
                withAnimation(.easeInOut) {
                    print("right")
                    currentIndex = min(10-1, currentIndex+1)
                }
            } label: {
                Text("right")
            }
        }
        .padding()
    }
    var body: some View {
        VStack(alignment: .center) {
            Carousel(pageCount: 10, visibleEdgeSpace: 14, spacing: 14, currentIndex: $currentIndex) { _ in
                GameDetailCardView()
            }
            .frame(height: 570)
            bottomBar
        }
        .background(.white)
    }
}

#Preview {
    GameDetailView()
}
