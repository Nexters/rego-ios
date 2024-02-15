//
//  GameDetailView.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import SwiftUI

struct GameDetailView: View {
    @State var currentIndex: Int = 0

    @State private var fetchDetailGames: [FetchDetailGamesModel] = Mock.detailGameMock

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
                    currentIndex = min(fetchDetailGames.count-1, currentIndex+1)
                }
            } label: {
                Text("right")
            }
        }
        .padding()
    }
    var body: some View {
        VStack(alignment: .center) {
            Carousel(gameDetails: fetchDetailGames, pageCount: fetchDetailGames.count, visibleEdgeSpace: 14, spacing: 14, currentIndex: $currentIndex) { idx in
                GameDetailCardView(gameDetail: fetchDetailGames[idx])
            }
            .frame(width: UIScreen.main.bounds.size.width, height: 570)
            HStack(spacing: 2){
                Body3Text("\(currentIndex+1)")
                Body4Text("/\(fetchDetailGames.count)")
                    .foregroundStyle(Color.gray200)
            }
            .padding(.vertical, 2)
            .padding(.horizontal, 12)
            .background(
                Capsule()
                    .foregroundStyle(.white.opacity(0.1))
            )
            bottomBar
        }
        .background(Color.gray900)
    }
}

#Preview {
    GameDetailView()
}
