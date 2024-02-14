//
//  FavoriteView.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import SwiftUI
import ComposableArchitecture

struct FavoriteView: View {
    let store: StoreOf<FavoriteViewFeature>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                Color.gray900
                VStack(alignment: .center) {
                    HStack(alignment: .center) {
                        Spacer().frame(width: 20)
                        H1Text("관심 게임")
                        Spacer().frame(width: 6)
                        H3Text("\(viewStore.favoriteItems.count)").foregroundColor(.gray200)
                        Spacer()
                    }
                    LazyVStack(spacing: 20) {
                        ForEachStore(
                            self.store.scope(state: \.rows, action: { .row(id: $0, action: $1) })
                        ) { childStore in
                            FavoriteItemView(store: childStore)
                        }
                    }
                    Spacer()
                }
            }
            .onAppear {
                viewStore.send(.loadGameList)
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
