//
//  GameFilterView.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import SwiftUI
import ComposableArchitecture

struct GameFilterView: View {
    let store: StoreOf<GameFilterFeature>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                Color.gray800
                VStack(alignment: .center) {
                    Spacer().frame(height: 24)
                    HStack(alignment: .center) {
                        Spacer().frame(width: 20)
                        H1Text("상세필터")
                        Spacer()
                        Button(action: {}, label: {
                            Image(.icon24Close)
                                .renderingMode(.template)
                                .foregroundColor(.gray100)
                        })
                        Spacer().frame(width: 20)
                    }
                    HStack {
                        Spacer().frame(width: 20)
                        Body4Text("중복 선택 가능해요.")
                        Spacer()
                    }
                    Spacer().frame(height: 24)
                    VStack(spacing: 20) {
                        peopleFilterView()
                        minuateFilterView()
                        useFilterView()
                        mcFilterView()
                        materialFilterView()
                    }
                    Spacer()
                    HStack(spacing: 14) {
                        Spacer().frame(width: 6)
                        Button(action: {
                            viewStore.send(.reset)
                        }, label: {
                            Image(.icon24Refresh)
                                .renderingMode(.template)
                                .foregroundColor(.gray100)
                            Subtitle4Text("초기화")
                        })
                        .padding(.horizontal, 14).padding(.vertical, 12)
                        .background(Color(uiColor: .gray700))
                        .cornerRadius(14)
                        Button(action: {}, label: {
                            Subtitle4Text("적용하기")
                        })
                        .padding(.horizontal, 14)
                        .frame(height: 48).frame(maxWidth: .infinity)
                        .background(Color.primary500)
                        .cornerRadius(14)
                        Spacer().frame(width: 6)
                    }
                    Spacer().frame(height: 14)
                }
            }
        }
    }
}

extension GameFilterView {
    @ViewBuilder
    func peopleFilterView() -> some View {
        GameFilterItemView(store: store.scope(
            state: \.peopleState,
            action: GameFilterFeature.Action.peopleFilter)
        )
    }

    @ViewBuilder
    func minuateFilterView() -> some View {
        GameFilterItemView(store: store.scope(
            state: \.minState,
            action: GameFilterFeature.Action.minFilter)
        )
    }

    @ViewBuilder
    func useFilterView() -> some View {
        GameFilterItemView(store: store.scope(
            state: \.useState,
            action: GameFilterFeature.Action.useFilter)
        )
    }
    
    @ViewBuilder
    func mcFilterView() -> some View {
        GameFilterItemView(store: store.scope(
            state: \.mcState,
            action: GameFilterFeature.Action.mcFilter)
        )
    }
    
    @ViewBuilder
    func materialFilterView() -> some View {
        GameFilterItemView(store: store.scope(
            state: \.materialState,
            action: GameFilterFeature.Action.materialFilter)
        )
    }
}

#Preview {
    GameFilterView(store: Store(
        initialState: GameFilterFeature.State(),
        reducer: {
            GameFilterFeature()
        }))
}
