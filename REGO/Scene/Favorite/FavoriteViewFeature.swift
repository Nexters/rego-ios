//
//  FavoriteViewFeature.swift
//  REGO
//
//  Created by 최모지 on 2/12/24.
//

import Foundation
import ComposableArchitecture
import SwiftUI

struct FavoriteViewFeature: Reducer {
    struct State: Equatable {
        var favoriteItems: [Game] = []
        var rows: IdentifiedArrayOf<FavoriteItemFeature.State> = []
    }

    enum Action: Equatable {
        case loadGameList
        case setGameList([Game])
        case row(id: FavoriteItemFeature.State.ID, action: FavoriteItemFeature.Action)
    }

    var body: some Reducer<State, Action> {
            Reduce { state, action in
                switch action {
                case .loadGameList:
                    // TODO: API 통신
                    let items: [Game] = [
                        Game(name: "이름테스트", type: "", descriptionType: "", favoriteNum: 1),
                        Game(name: "이름테스트2", type: "", descriptionType: "", favoriteNum: 1),
                        Game(name: "이름테스트3", type: "", descriptionType: "", favoriteNum: 1)
                    ]

                    return .send(.setGameList(items))
                case .setGameList(let items):
                    state.favoriteItems = items
                    for favoriteItem in state.favoriteItems {
                        state.rows.append(FavoriteItemFeature.State(id: UUID(), name: favoriteItem.name))
                    }
                    return .none
                case .row(let id, let action):
                    return .none
                }
            }.forEach(\.rows, action: /Action.row) {
                FavoriteItemFeature()
            }
        }
}
