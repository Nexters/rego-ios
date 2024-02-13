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
        var gameList: [Game] = []
        var gameStateList: [FavoriteItemFeature.State] = []
    }

    enum Action: Equatable {
        case loadGameList
        case receivedGameList([Game])

        case setGameInfo(FavoriteItemFeature.Action)
    }

    var body: some Reducer<State, Action> {
        Reduce { _, action in
            switch action {
            case .loadGameList:
                // TODO: API 통신
                let list: [Game] = [
                    Game(name: "test11", type: "", descriptionType: "", favoriteNum: 1),
                    Game(name: "test22", type: "", descriptionType: "", favoriteNum: 1)
                ]
                return .send(.receivedGameList(list))
            case .receivedGameList:
                return .none
            case .setGameInfo(let game):
                return .none
            }
        }

    }
}
