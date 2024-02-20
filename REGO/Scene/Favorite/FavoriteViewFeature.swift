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
        var favoriteItems: [GameData] = []
        var rows: IdentifiedArrayOf<FavoriteItemFeature.State> = []
    }

    enum Action: Equatable {
        case loadGameList
        case setGameList([GameData])
        case row(id: FavoriteItemFeature.State.ID, action: FavoriteItemFeature.Action)
    }

    var body: some Reducer<State, Action> {
            Reduce { state, action in
                switch action {
                case .loadGameList:
                    // TODO: API 통신
                    let items: [GameData] = [
                        GameData(gameUUID: 0, title: "테스트1", rank: 0, gameSummary: GameSummary(gameTime: "", gamePeople: ""), likeCount: 0, iconType: .ACTIVE, like: true),
                        GameData(gameUUID: 0, title: "테스트2", rank: 0, gameSummary: GameSummary(gameTime: "", gamePeople: ""), likeCount: 0, iconType: .ACTIVE, like: true),
                        GameData(gameUUID: 0, title: "테스트3", rank: 0, gameSummary: GameSummary(gameTime: "", gamePeople: ""), likeCount: 0, iconType: .ACTIVE, like: true)
                    ]

                    return .send(.setGameList(items))
                case .setGameList(let items):
                    state.favoriteItems = items
                    for favoriteItem in state.favoriteItems {
                        state.rows.append(FavoriteItemFeature.State(id: UUID(), name: favoriteItem.title))
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
