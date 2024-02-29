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
    @State private var fetchGames: FetchGamesModel = .init(userLikeCount: 0, games: []) /*= Mock.fetchGamesMock*/
    //    @State private var selectedIndex: Int = 0
    @State private var selectedCategory: String = "" //

    @State private var isLoading: Bool = true
    @State private var isShowToast: Bool = false
    @State private var isAddToast: Bool = false
    @State private var userLikeCount: Int64 = 0
    /// 필터 bottom sheet present 여부
    @State private var isPresentSheet: Bool = false

    var homeCategory: HomeCategoryEnum
    @State var filterTags: [FilterTag] = []

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    H1Text(homeCategory.title)
                    Spacer()
                    if homeCategory == .FILTER {
                        Button(action: {
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
                .padding(.vertical, 20)

                if [.ENTERTAINMENT, .THEME, .MATERIALS].contains(homeCategory) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 14) {
                            Spacer().frame(width: 6)
                            ForEach(fetchGames.games.map({$0.category}), id: \.self) { category in
                                CategoryButton(selectedCategory: $selectedCategory, title: category, selectedColor: .primary500, deSelectedColor: .gray800)
                            }
                            Spacer().frame(width: 6)
                        }
                        .frame(height: 34)
                    }
                    .padding(.bottom, 14)
                }
                else if !filterTags.isEmpty, homeCategory == .FILTER {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            Spacer().frame(width: 20)
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
                            Spacer().frame(width: 20)
                        }
                    }
                    .frame(height: 34)
                    .padding(.bottom, 14)
                }

                ScrollViewReader(content: { proxy in
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 24) { // section과 header사이의 간격
                            ForEach(fetchGames.games, id: \.category) { game in
                                if !game.data.isEmpty {
                                    Section {
                                        VStack {
                                            VStack(alignment: .leading, spacing: 24, content: {
                                                ForEach(game.data, id: \.gameUuid) { gameData in
                                                    NavigationLink {
                                                        GameDetailView(gameUuids: fetchGames.games.flatMap({ game in
                                                            game.data.map { $0.gameUuid }
                                                        }), selectedGameUuid: gameData.gameUuid)
                                                    } label: {
                                                        GameRowView(gameData: gameData, isShowToast: $isShowToast, isAddToast: $isAddToast)
                                                    }.buttonStyle(.plain)
                                                }
                                            })
                                            Spacer().frame(height: 10) // 34를 맞추기 위해
                                        }
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
                                                Subtitle1Text(game.category)
                                            }
                                        }
                                    }
                                    .id(game.category)
                                }
                            }
                        }// vstack
                        .onReceive(selectedCategory.publisher, perform: { _ in
                            withAnimation {
                                proxy.scrollTo(selectedCategory, anchor: .top)
                            }
                        })
                        .padding(.top, 20)
                    } // ScrollView
                }) // reader
            }
            .background(Color.gray900)
            .overlayIf($isLoading,
                       LottieView(filename: "loading_lottie")
                .frame(width: 60, height: 60)
            )
            .onChange(of: filterTags, perform: { tags in
                Task {
                    if homeCategory == .FILTER {
                        let fetchGames = try await NetworkManager.shared.request(type: FetchGamesModel.self, api: .fetchGames(tags: tags, category: nil))
                        self.fetchGames = fetchGames
                        self.userLikeCount = fetchGames.userLikeCount
                        isLoading = false
                    }
                }
            })
            .onAppear {
                Task {
                    if homeCategory == .FILTER {
                        let fetchGames = try await NetworkManager.shared.request(type: FetchGamesModel.self, api: .fetchGames(tags: filterTags, category: nil))
                        self.fetchGames = fetchGames
                        self.userLikeCount = fetchGames.userLikeCount
                        isLoading = false
                    }
                    else {
                        let fetchGames = try await NetworkManager.shared.request(type: FetchGamesModel.self, api: .fetchGames(tags: filterTags, category: homeCategory))
                        self.fetchGames = fetchGames
                        self.userLikeCount = fetchGames.userLikeCount
                        isLoading = false
                    }
                }
            }
            .sheet(isPresented: $isPresentSheet) {
                GameFilterView(store: Store(
                    initialState: GameFilterFeature.State(selectedGameTypes: filterTags),
                    reducer: {
                        GameFilterFeature()
                    }), filterTags: $filterTags)
                .presentationDetents([.height(680)])
                .edgesIgnoringSafeArea(.bottom)
            }
            .modifier(NavToolbarModifier(likeCnt: $userLikeCount))
            .onChange(of: isShowToast) { _ in
                if isShowToast {
                    if isAddToast {
                        self.userLikeCount += 1
                    }
                    else {
                        self.userLikeCount -= 1
                    }
                }
            }
            // Vstack
            if isShowToast {
                VStack {
                    Spacer()
                    FavoriteToastView(didAdd: isAddToast)
                        .padding(.horizontal, 20)
                    Spacer().frame(height: 30)
                }
            }
        } // Zstack

    }
}

#Preview {
    GameListView(homeCategory: .FILTER)
}
