//
//  GameRowView.swift
//  REGO
//
//  Created by kokojong on 2/12/24.
//

import SwiftUI

struct GameRowView: View {
    let gameData: GameData
    let rank: Int?

    @State private var isLiked = false
    @State private var like: Int

    init(gameData: GameData) {
        self.gameData = gameData
        self.rank = gameData.rank
        self._like = .init(initialValue: Int(gameData.likeCount))
    }

    var likeButton: some View {
        Button {
            isLiked.toggle()
            if isLiked {
                like += 1
                Task {
                    try await NetworkManager.shared.request(api: .likeGame(id: gameData.gameUuid))
                }
            }
            else {
                like -= 1
                Task {
                    try await NetworkManager.shared.request(api: .unlikeGame(id: gameData.gameUuid))
                }
            }
        } label: {
            LikeButtonView(isLiked: $isLiked, likeCnt: $like)
        }
    }

    var body: some View {
        HStack(spacing: 15) {
            Spacer(minLength: 5)
            gameData.iconType.image
                .resizable()
                .frame(width: rank == 1 ? 110 : 60, height: rank == 1 ? 110 : 60)
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(gameData.iconType.bgColor)
                }
                .rotationEffect(rank == 1 ? .degrees(-6) : .zero)

            VStack(alignment: .leading, spacing: 2) {
                if let rank = gameData.rank {
                    if rank == 1 {
                        VStack(alignment: .leading, spacing: 4) {
                            H3Text("\(rank)위")
                            HStack {
                                H2Text(gameData.title)
                                    .lineLimit(1)
                                Spacer()
                                likeButton
                            }
                        }
                    }
                    else {
                        HStack {
                            if let rank = gameData.rank {
                                Subtitle5Text("\(rank)위")
                            }
                            Subtitle2Text("\(gameData.title)")
                                .lineLimit(1)
                            Spacer()
                            likeButton
                        }
                    }
                }
                else {
                    HStack {
                        Subtitle2Text("\(gameData.title)")
                            .lineLimit(1)
                        Spacer()
                        likeButton
                    }
                }

                HStack(spacing: 4) {
                    Body4Text("시간")
                    Body2Text("\(gameData.gameSummary.gameTime)")
                    Text(" | ")
                        .foregroundStyle(Color.gray500)
                    Body4Text("인원")
                    Body2Text("\(gameData.gameSummary.gamePeople)")
                }
                .foregroundStyle(Color.gray300)
            }
            Spacer(minLength: 5)
        }
        .background(Color.gray900)
    }
}
