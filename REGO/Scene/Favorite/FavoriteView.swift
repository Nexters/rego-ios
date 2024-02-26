//
//  FavoriteView.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import SwiftUI
import UIKit
import ComposableArchitecture

struct FavoriteView: View {
    let store: StoreOf<FavoriteViewFeature>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                Color.gray900
                VStack(alignment: .center) {
                    Spacer().frame(height: 106)
                    HStack(alignment: .center) {
                        Spacer().frame(width: 20)
                        H1Text("관심 게임")
                        Spacer().frame(width: 6)
                        H3Text("\(viewStore.likeGames.count)").foregroundColor(.gray200)
                        Spacer()
                    }
                    peopleFilterView()
                        .opacity(viewStore.likeGames.isEmpty ? 0 : 1)
                    FavoriteEmptyView()
                        .opacity(viewStore.likeGames.isEmpty ? 1 : 0)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden()
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    NavBackButtonView()
                }
            })
            .background(Color.gray900)
            .onAppear {
                viewStore.send(.fetchLikeGames)
            }
        }
    }
}

extension FavoriteView {
    @ViewBuilder
    func peopleFilterView() -> some View {
        LazyVStack(spacing: 20) {
            ForEachStore(
                self.store.scope(state: \.rows, action: { .row(id: $0, action: $1) })
            ) { childStore in
                NavigationLink {
                    WithViewStore(store, observe: { $0 }) { viewStore in
                        GameDetailView(gameUuids: viewStore.likeGames.map { $0.gameUuid }, selectedGameUuid: childStore.game.gameUuid)
                    }

                } label: {
                    FavoriteItemView(store: childStore)
                }
            }
        }
    }
}

#Preview {
    FavoriteView(store: Store(
        initialState: FavoriteViewFeature.State(),
        reducer: {
            FavoriteViewFeature()
        })
    )
}
