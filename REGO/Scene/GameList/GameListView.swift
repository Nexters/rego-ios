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
                .padding(.bottom)
            Text("인기 게임")
            LazyVStack(alignment: .leading, content: {
                ForEach(Array(zip(gameList.prefix(5).indices, gameList)), id: \.0) { idx, game in
                    GameRowView(game: game, rank: idx+1)
                }
            })

            Text("전체 게임")
            LazyVStack(alignment: .leading, content: {
                ForEach(gameList.suffix(from: 5), id: \.id) { game in
                    GameRowView(game: game)
                }
            })
        }
        .padding(20)
    }
}

struct GameRowView: View {

    let rank: Int?
    let game: Game

    @State private var isLiked = false

    init(game: Game, rank: Int? = nil) {
        self.game = game
        self.rank = rank
    }

    var body: some View {
        HStack {
            Image(systemName: "star")
                .resizable()
                .frame(width: 60, height: 60)
            VStack(alignment: .leading) {
                HStack {
                    if let rank {
                        Text("\(rank)위")
                    }
                    Text("\(game.name)")
                    Spacer()
                    LikeButtonView(isLiked: $isLiked)
                }
                HStack {
                    Text("소요시간 30m | 참여인원 5~10명")
                }
                .foregroundStyle(.gray)
            }
        }
        .padding()
    }
}

#Preview {
    GameListView()
}
