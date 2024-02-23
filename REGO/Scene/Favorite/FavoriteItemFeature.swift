//
//  FavoriteItemFeature.swift
//  REGO
//
//  Created by 최모지 on 2/12/24.
//

import Foundation
import ComposableArchitecture
import SwiftUI

struct FavoriteItemFeature: Reducer {
    struct State: Equatable, Identifiable {
        var id: UUID

        var game: LikeGame
        var isSelected: Bool = true
    }

    enum Action: Equatable {
        case loadGameInfo(LikeGame)
        case likeGame
        case unlikeGame
        case setselectItem
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .loadGameInfo(let game):
            state.game = game
            return .none
        case .likeGame:
            let game = state.game
            return .run { send in
                do {
                    try await NetworkManager.shared.request(api: .likeGame(id: game.gameUuid))
                    await send(.setselectItem)
                }
                catch {
                    print("@@@@@ network error")
                }
            }
        case .unlikeGame:
            let game = state.game
            return .run { send in
                do {
                    try await NetworkManager.shared.request(api: .unlikeGame(id: game.gameUuid))
                    await send(.setselectItem)
                }
                catch {
                    print("@@@@@ network error")
                }
            }
        case .setselectItem:
            state.isSelected.toggle()
            return .none
        }
    }
}
