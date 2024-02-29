//
//  GameDetailView.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import SwiftUI

struct GameDetailView: View {
    @State var currentIndex: Int = 0

    @State private var fetchDetailGames: FetchDetailModel =
        .init(userCountLike: 0, games: [])
//    FetchDetailModel(userCountLike: 0, games: [])
    @State private var userLikeCount: Int64 = 0

    @State private var isLoading: Bool = true

    var gameUuids: [Int64]
    var selectedGameUuid: Int64

    var body: some View {
        ZStack {
            GameDetailBackgroundView()
            VStack(alignment: .center, spacing: 20) {
                Spacer()
                Carousel(gameDetails: fetchDetailGames.games, pageCount: fetchDetailGames.games.count, visibleEdgeSpace: 14, spacing: 14, currentIndex: $currentIndex) { idx in
                    GameDetailCardView(gameDetail: fetchDetailGames.games[idx])
                }
                .frame(width: UIScreen.main.bounds.size.width, height: 570)
                HStack(spacing: 2){
                    Body3Text("\(currentIndex+1)")
                    Body4Text("/")
                        .foregroundStyle(Color.gray200)
                    Body4Text("\(fetchDetailGames.games.count)")
                        .foregroundStyle(Color.gray200)
                }
                .padding(.vertical, 2)
                .padding(.horizontal, 12)
                .frame(height: 26)
                .background(
                    Capsule()
                        .foregroundStyle(.white.opacity(0.1))
                )
                Spacer()
            }
        }
        .overlayIf($isLoading,
            LottieView(filename: "loading_lottie")
                .frame(width: 60, height: 60)
        )
        .onAppear {
            Task{
                let fetchDetails = try await NetworkManager.shared.request(type: FetchDetailModel.self, api: .fetchDetails(ids: gameUuids))
                self.fetchDetailGames = fetchDetails
                isLoading = false
                currentIndex = fetchDetailGames.games.firstIndex { gameDetail in
                    gameDetail.gameUuid == selectedGameUuid
                } ?? 0

            }
        }
        .modifier(NavToolbarModifier(likeCnt: $userLikeCount))
        .navigationTitle("게임 설명")
        .font(.subtitle3)
    }
}

#Preview {
    GameDetailView(gameUuids: [3, 5], selectedGameUuid: 3)
}
