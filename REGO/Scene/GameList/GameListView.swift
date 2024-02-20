//
//  GameListView.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import SwiftUI
import Combine

struct GameListView: View {
    @State private var fetchGames: FetchGamesModel = Mock.fetchGamesMock
    //    @State private var selectedIndex: Int = 0
    @State private var selectedCategory: String = "" //

    var homeCategory: HomeCategoryEnum

    var body: some View {
        VStack(alignment: .leading) {
            H1Text(homeCategory.title)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)

            if [.ENTERTAINMENT, .THEME, .MATERIALS].contains(homeCategory) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(fetchGames.games.map({$0.category}), id: \.self) { category in
                            CategoryButton(selectedCategory: $selectedCategory, title: category, selectedColor: .primary500, deSelectedColor: .gray800)
                        }
                    }
                }
                .frame(height: 34)
                .padding(.horizontal, 20)
            }
            else if homeCategory == .FILTER { // TODO: 필터 UI 추가

            }

            ScrollViewReader(content: { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 34) {
                        VStack(alignment: .leading, spacing: 24) {
                            ForEach(fetchGames.games, id: \.category) { game in
                                Section {
                                    VStack(alignment: .leading, spacing: 24, content: {
                                        ForEach(game.data, id: \.gameUUID) { gameData in
                                            NavigationLink {
                                                GameDetailView(gameUuids: fetchGames.games.flatMap({ game in
                                                    game.data.map { $0.gameUUID }
                                                }), selectedGameUuid: gameData.gameUUID)
                                            } label: {
                                                GameRowView(gameData: gameData)
                                            }.buttonStyle(.plain)
                                        }
                                    })
                                } header: {
                                    if game.category == "인기" {
                                        HStack(spacing: 4) {
                                            Spacer().frame(width: 16)
                                            H4Text("인기 TOP")
                                            H4Text("5")
                                                .foregroundStyle(Color.primary500)
                                        }
                                    }
                                    else {
                                        HStack {
                                            Spacer().frame(width: 20)
                                            H4Text(game.category)
                                        }
                                    }
                                }
                                .id(game.category)
                            }
                        }
                    } // vstack
                    .onReceive(selectedCategory.publisher, perform: { _ in
                        withAnimation {
                            proxy.scrollTo(selectedCategory, anchor: .top)
                        }
                    })
                    .padding(.top, 34)
                } // ScrollView
            }) // reader
        }
        .onAppear {
            Task {
                let fetchGames = try await NetworkManager.shared.request(type: FetchGamesModel.self, api: .fetchGames(tags: ["type1", "type2", "type3"], category: "aaaa"))
                print("fetchGames", fetchGames)
            }
        }
        .modifier(NavToolbarModifier(likeCnt: fetchGames.userLikeCount))

    }
}

#Preview {
    GameListView(homeCategory: .THEME)
}
