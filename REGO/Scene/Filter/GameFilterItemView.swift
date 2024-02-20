//
//  GameFilterItemView.swift
//  REGO
//
//  Created by 최모지 on 2/5/24.
//

import SwiftUI
import ComposableArchitecture

struct GameFilterItemView: View {
    let store: StoreOf<GameFilterItemFeature>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                HStack {
                    Spacer().frame(width: 20)
                    Subtitle3Text(viewStore.title)
                    Spacer()
                }
                Spacer().frame(height: 14)
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 14) {
                        Spacer().frame(width: 20)
                        ForEach(viewStore.allGameTypes, id: \.self) { type in
                            Button(action: {
                                viewStore.send(.selectGameType(type))
                            }, label: {
                                Body1Text(type.title)
                                    .foregroundColor(.gray100)
                            })
                            .padding(.horizontal, 14).padding(.vertical, 8)
                            .background(viewStore.selectedGameTypes.contains(type) ? Color.primary500 : Color.gray400)
                            .cornerRadius(10)
                        }
                    }
                }.frame(height: 38)
            }
        }
    }
}

#Preview {
    GameFilterItemView(store: Store(
        initialState: GameFilterItemFeature.State(title: "인원 수", allGameTypes: GameType.peopleTypes),
        reducer: {
            GameFilterItemFeature()
        }))
}
