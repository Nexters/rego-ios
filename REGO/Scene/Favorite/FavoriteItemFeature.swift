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

        var name: String = ""
        var isSelected: Bool = false
    }

    enum Action: Equatable {
        case loadGameInfo(Game)
        case selectItem
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .loadGameInfo(let game):
            state.name = game.name
            return .none
        case .selectItem:
            state.isSelected.toggle()
            return .none
        }
    }
}
