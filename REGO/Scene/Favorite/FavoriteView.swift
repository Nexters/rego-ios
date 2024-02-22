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
                        H3Text("\(viewStore.favoriteItems.count)").foregroundColor(.gray200)
                        Spacer()
                    }
                    peopleFilterView()
                        .opacity(viewStore.favoriteItems.isEmpty ? 0 : 1)
                    FavoriteEmptyView()
                        .opacity(viewStore.favoriteItems.isEmpty ? 1 : 0)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .toolbarBackground(Color.gray900)            
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .onAppear {
                viewStore.send(.loadGameList)
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
                FavoriteItemView(store: childStore)
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
