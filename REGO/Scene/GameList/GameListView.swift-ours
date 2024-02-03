//
//  GameListView.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import SwiftUI

struct GameListView: View {
    @State private var gameList: [Game] = [
        Game(name: "스파이는 누구", type: "", descriptionType: "", favoriteNum: 10),
        Game(name: "바뀐 모습 찾기", type: "", descriptionType: "", favoriteNum: 9),
        Game(name: "좀비 게임", type: "", descriptionType: "", favoriteNum: 8),
        Game(name: "병뚜껑 멀리 보내기", type: "", descriptionType: "", favoriteNum: 6),
        Game(name: "대장금 게임", type: "", descriptionType: "", favoriteNum: 3),
        Game(name: "인간 윷놀이", type: "", descriptionType: "", favoriteNum: 11),
        Game(name: "꼬깔꼬깔 대작전", type: "", descriptionType: "", favoriteNum: 13),
        Game(name: "인물 퀴즈", type: "", descriptionType: "", favoriteNum: 30)
    ].sorted {
        $0.favoriteNum > $1.favoriteNum
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("스피드 게임")
                .font(RegoFontStyle.h1.font)
                .frame(height: 59)
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Section {
                        LazyVStack(alignment: .leading, content: {
                            ForEach(Array(zip(gameList.prefix(5).indices, gameList)), id: \.0) { idx, game in
                                GameRowView(game: game, rank: idx+1)
                            }
                        })
                    } header: {
                        Text("인기 게임")
                    }

                    Text("전체 게임")
                    LazyVStack(alignment: .leading, content: {
                        ForEach(gameList.suffix(from: 5), id: \.id) { game in
                            GameRowView(game: game)
                        }
                    })
                }
            }
        }.padding(20)
    }
}

struct GameRowView: View {
    let rank: Int?
    let game: Game

    @State private var isLiked = false
    @State private var likeCnt: Int

    init(game: Game, rank: Int? = nil) {
        self.game = game
        self.rank = rank
        self._likeCnt = .init(initialValue: game.favoriteNum)
    }

    var body: some View {
        HStack {
            Image([._3DActive, ._3DKnowledge, ._3DMission, ._3DSong, ._3DSpeed, ._3DTaste, ._3DTaste, ._3DTouch].randomElement()!)
                .resizable()
                .frame(width: 60, height: 60)
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    if let rank {
                        Text("\(rank)위")
                            .font(RegoFontStyle.subtitle5.font)
                    }
                    Text("\(game.name)")
                        .font(RegoFontStyle.subtitle2.font)
                }
                HStack(spacing: 4) {
                    Text("소요시간")
                        .font(RegoFontStyle.body4.font)
                    Text("30m")
                        .font(RegoFontStyle.body2.font)
                    Text(" | ")
                    Text("참여인원")
                        .font(RegoFontStyle.body4.font)
                    Text("5~10명")
                        .font(RegoFontStyle.body2.font)
                }
                .foregroundStyle(Color(uiColor: .gray500))
            }
            Spacer()
            LikeButtonView(isLiked: $isLiked, likeCnt: $likeCnt)
        }
    }
}

#Preview {
    GameListView()
}
