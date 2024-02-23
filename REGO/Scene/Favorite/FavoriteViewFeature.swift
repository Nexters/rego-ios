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
        var likeGames: [LikeGame] = []
        var rows: IdentifiedArrayOf<FavoriteItemFeature.State> = []
        var isLoading: Bool = false
    }

    enum Action: Equatable {
        case fetchLikeGames
        case setLikeGames([LikeGame])
        case row(id: FavoriteItemFeature.State.ID, action: FavoriteItemFeature.Action)
    }

    var body: some Reducer<State, Action> {
            Reduce { state, action in
                switch action {
                case .fetchLikeGames:
                    return .run { send in
                        do {
                            let response = try await NetworkManager.shared.request(type: LikeGames.self, api: .fetchLikeGames)
                            await send(.setLikeGames(response.like))
                        }
                        catch {
                            print("@@@@@ network error")
                        }
                    }
                case .setLikeGames(let items):
                    state.likeGames = items
                    for likeGame in state.likeGames {
                        state.rows.append(FavoriteItemFeature.State(id: UUID(), game: likeGame))
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
