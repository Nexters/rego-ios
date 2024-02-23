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
        var isSelected: Bool = true // 기본은 선택된것(관심 게임 리스트)
    }

    enum Action: Equatable {
        case loadGameInfo(LikeGame)
        case sendSelectItem
        case setselectItem
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .loadGameInfo(let game):
            state.game = game // MARK: name state 대신 LikeGame 모델로 바꿔봄!
            return .none
        case .sendSelectItem:
            // TODO: API 통신
            return .send(.setselectItem)
        case .setselectItem:
            state.isSelected.toggle()
            return .none
        }
    }
}
