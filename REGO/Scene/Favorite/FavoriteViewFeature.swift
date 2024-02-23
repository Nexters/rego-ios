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
        var favoriteItems: [LikeGame] = []
        var rows: IdentifiedArrayOf<FavoriteItemFeature.State> = []
    }

    enum Action: Equatable {
        case loadGameList(TaskResult<[LikeGame]>)
        case setGameList([LikeGame])
        case row(id: FavoriteItemFeature.State.ID, action: FavoriteItemFeature.Action)
    }

    var body: some Reducer<State, Action> {
            Reduce { state, action in
                switch action {
                case .loadGameList:
                    // TODO: API 통신
                    let items: [LikeGame] = [
                        LikeGame(heartID: 1, gameUuid: 1, iconType: .KNOWLEDGE, title: "테스트트트트1"),
                        LikeGame(heartID: 2, gameUuid: 2, iconType: .MISSION, title: "테스트트트트2"),
                        LikeGame(heartID: 3, gameUuid: 3, iconType: .SONG, title: "테스트트트트3"),
                        LikeGame(heartID: 4, gameUuid: 4, iconType: .SPEED, title: "테스트트트트4"),
                        LikeGame(heartID: 5, gameUuid: 5, iconType: .TASTE, title: "테스트트트트5")
                    ]

//                    return .run { send in
//                        await send(.loadGameList(
//                            TaskResult {
//                                let result = try await NetworkManager.shared.request(type: LikeGames.self, api: .fetchLikeGames)
//                                return result.like
//                            }
//                        ))
//                    }

                    return .send(.setGameList(items))
                case .setGameList(let items):
                    state.favoriteItems = items
                    for favoriteItem in state.favoriteItems {
                        state.rows.append(FavoriteItemFeature.State(id: UUID(), game: favoriteItem))
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
