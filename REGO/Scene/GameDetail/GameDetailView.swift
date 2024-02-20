//
//  GameDetailView.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import SwiftUI

struct GameDetailView: View {
    @State var currentIndex: Int = 0

    @State private var fetchDetailGames: FetchDetailModel = Mock.detailGameMock

    var gameUuids: [Int64]
    var selectedGameUuid: Int64

    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Spacer()
                Carousel(gameDetails: fetchDetailGames.games, pageCount: fetchDetailGames.games.count, visibleEdgeSpace: 14, spacing: 14, currentIndex: $currentIndex) { idx in
                    GameDetailCardView(gameDetail: fetchDetailGames.games[idx])
                }
                .frame(width: UIScreen.main.bounds.size.width, height: 570)
                HStack(spacing: 2){
                    Body3Text("\(currentIndex+1)")
                    Body4Text("/\(fetchDetailGames.games.count)")
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
        .onAppear {
            Task{
//                let fetchDetails = try await NetworkManager.shared.request(type: FetchGamesModel.self, api: .fetchDetails(ids: gameUuids))
//                print("fetchDetails", fetchDetails)

                currentIndex = fetchDetailGames.games.firstIndex { gameDetail in
                    gameDetail.gameUUID == selectedGameUuid
                } ?? 0

                print(fetchDetailGames.games.map({$0.gameUUID}))
                print("selectedGameUuid", selectedGameUuid)
                print("currentIndex", currentIndex)

            }
        }
        .modifier(NavToolbarModifier(likeCnt: fetchDetailGames.userCountLike))
        .navigationTitle("게임 설명")
    }
}

#Preview {
    GameDetailView(gameUuids: [], selectedGameUuid: 1)
}
