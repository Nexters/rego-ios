//
//  GameListView.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import SwiftUI
import ComposableArchitecture
import Combine

struct GameListView: View {
    @State private var fetchGames: FetchGamesModel = Mock.fetchGamesMock
    //    @State private var selectedIndex: Int = 0
    @State private var selectedCategory: String = "" //

    /// 필터 bottom sheet present 여부
    @State private var isPresentSheet: Bool = false

    var homeCategory: HomeCategoryEnum
    @State var filterTags: [FilterTagEnum]?

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                H1Text(homeCategory.title)
                Spacer()
                if homeCategory == .FILTER {
                    Button(action: {
                        // TODO: Filter View 띄우기
                        self.isPresentSheet.toggle()
                    }, label: {
                        Image(.icon24Filter)
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(.white)
                            .tint(.white)
                            .frame(width: 20, height: 20)
                            .padding(7)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color.primary500)
                            )
                    })
                }
            }
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
            else if let filterTags = filterTags, !filterTags.isEmpty, homeCategory == .FILTER {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(filterTags, id: \.rawValue) { tag in
                            HStack(spacing: 2) {
                                Body3Text(tag.title)
                                    .foregroundStyle(.white)
                                Button(action: {
                                    self.filterTags = filterTags.filter { $0.rawValue != tag.rawValue
                                    }
                                }, label: {
                                    Image(.icon24Close)
                                        .renderingMode(.original)
                                        .resizable()
                                        .foregroundColor(.white)
                                        .tint(.white)
                                        .frame(width: 14, height: 14)
                                })
                            }
                            .padding(.horizontal, 14)
                            .padding(.vertical, 6)
                            .frame(height: 34)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color.primary500)
                            )
                        }
                    }
                }
                .frame(height: 34)
                .padding(.horizontal, 20)
                .padding(.bottom, 14)
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
        .sheet(isPresented: $isPresentSheet) {
            GameFilterView(store: Store(
                initialState: GameFilterFeature.State(),
                reducer: {
                    GameFilterFeature()
                }))
            .presentationDetents([.height(680)])
            .edgesIgnoringSafeArea(.bottom)
        }
        .modifier(NavToolbarModifier(likeCnt: fetchGames.userLikeCount))
    }
}

#Preview {
    GameListView(homeCategory: .FILTER)
}
