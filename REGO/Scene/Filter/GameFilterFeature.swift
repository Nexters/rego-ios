//
//  GameFilterFeature.swift
//  REGO
//
//  Created by 최모지 on 2/12/24.
//

import ComposableArchitecture
import SwiftUI

struct GameFilterFeature: Reducer {
    struct State: Equatable {
        var selectedGameTypes: [GameType] = []
    }

    enum Action: Equatable {
        case selectGameType(GameType)
        case resetSelectedGameTypes
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .selectGameType(let type):
            state.selectedGameTypes.append(type)
            return .none
        case .resetSelectedGameTypes:
            state.selectedGameTypes = []
            return .none
        }
    }
}

