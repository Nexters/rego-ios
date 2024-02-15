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

    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Spacer()
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
                Spacer()
            }
            .background(Color.gray900)
        }
        .modifier(NavToolbarModifier())
        .navigationTitle("게임 설명")
    }
}

#Preview {
    GameDetailView()
}
