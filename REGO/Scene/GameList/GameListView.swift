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
    @State private var selectedCategory: String = "카테고리1" // TODO: 

    var body: some View {
        VStack(alignment: .leading) {
            H1Text("스피드 게임") // TODO: Title 넘겨주기
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
            Text("selectedCategory\( selectedCategory)")
            if !fetchGames.allGames.compactMap({$0.category}).isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(fetchGames.allGames.compactMap({$0.category}), id: \.self) { category in
                            CategoryButton( selectedCategory: $selectedCategory, title: category, selectedColor: .primary500, deSelectedColor: .gray800)
                        }
                    }
                }
                .frame(height: 34)
                .padding(.horizontal, 20)
            }
            ScrollViewReader(content: { proxy in
                //
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 34) {
                        Button(action: {
                            proxy.scrollTo(selectedCategory, anchor: .top)
                        }, label: {
                            Text("이동하기")
                        })
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
                                .id(allGame.category)
                            }
                        }
                    }
                    .onReceive(selectedCategory.publisher, perform: { _ in
                        withAnimation {
                            proxy.scrollTo(selectedCategory, anchor: .top)
                        }
                    })
                    .padding(.top, 34)
                } // ScrollView
                .padding(.horizontal, 20)
            }) // reader
        }
        .modifier(NavToolbarModifier())

    }
}

#Preview {
    GameListView()
}
