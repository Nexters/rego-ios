//
//  GameListView.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import SwiftUI

struct GameListView: View {
    @State private var fetchGames: FetchGamesModel = Mock.fetchGamesMock

    var body: some View {
        VStack(alignment: .leading, spacing: 34) {
                H1Text("스피드 게임")
                    .frame(height: 59)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 34) {
                    Section {
                        LazyVStack(alignment: .leading, spacing: 24, content: {
                            ForEach(fetchGames.popularGames) { gameInfo in
                                GameRowView(gameInfo: gameInfo)
                            }
                        })
                    } header: {
                        HStack(spacing: 4) {
                            H4Text("인기 TOP")
                            H4Text("5")
                                .foregroundStyle(Color.primary500)
                        }
                    }
                    VStack(alignment: .leading, spacing: 24) {
                        ForEach(fetchGames.allGames, id: \.category) { allGame in
                            Section {
                                VStack(alignment: .leading, spacing: 24, content: {
                                    ForEach(allGame.info, id: \.gameUUID) { gameInfo in
                                        GameRowView(gameInfo: gameInfo)
                                    }
                                })
                            } header: {
                                if let category =  allGame.category {
                                    H4Text("\(category)")
                                }
                                else {
                                    Subtitle1Text("이런 게임은 어때요?")
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    GameListView()
}
