//
//  GameFilterItemFeature.swift
//  REGO
//
//  Created by 최모지 on 2/12/24.
//

import ComposableArchitecture
import SwiftUI

struct GameFilterItemFeature: Reducer {
    struct State: Equatable {
        var title: String
        var allGameTypes: [FilterTag]
        var selectedGameTypes: [FilterTag] = []
    }

    enum Action: Equatable {
        case selectGameType(FilterTag)
        case reset
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .selectGameType(let type):
            if !state.selectedGameTypes.contains(type) {
                state.selectedGameTypes.append(type)
            }
            else {
                if let index = state.selectedGameTypes.firstIndex(of: type) {
                    state.selectedGameTypes.remove(at: index)
                }
            }
            return .none
        case .reset:
            state.selectedGameTypes = []
            return .none
        }
    }
}
