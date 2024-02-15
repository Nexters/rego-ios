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
        VStack(alignment: .leading) {
            H1Text("스피드 게임") // TODO: Title 넘겨주기
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 34) {
                    Section {
                        LazyVStack(alignment: .leading, spacing: 24, content: {
                            ForEach(fetchGames.popularGames) { gameInfo in
                                NavigationLink {
                                    GameDetailView()
                                } label: {
                                    GameRowView(gameInfo: gameInfo)
                                }.buttonStyle(.plain)
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
                                        NavigationLink {
                                            GameDetailView()
                                        } label: {
                                            GameRowView(gameInfo: gameInfo)
                                        }.buttonStyle(.plain)
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
                .padding(.top, 34)
            } // ScrollView
            .padding(.horizontal, 20)
        }
        .modifier(NavToolbarModifier())
    }
}

#Preview {
    GameListView()
}
