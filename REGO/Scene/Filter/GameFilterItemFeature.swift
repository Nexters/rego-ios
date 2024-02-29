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
        case selectGameTypes([FilterTag])
        case reset
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .selectGameType(let type):
            print("✅ 부분 select 이전", state.selectedGameTypes, type)
            if !state.selectedGameTypes.contains(type) {
                state.selectedGameTypes.append(type)
            }
            else {
                if let index = state.selectedGameTypes.firstIndex(of: type) {
                    state.selectedGameTypes.remove(at: index)
                }
            }
            print("✅ 부분 select 이후", state.selectedGameTypes, type)
            return .none
        case .selectGameTypes(let tags):
            print("✅부분 적용전", state.selectedGameTypes, tags)
            var actions: [ Effect<Action>] = []
            tags.forEach {
                actions.append( Effect<Action>.send(.selectGameType($0)))
            }
            print("✅부분 적용후", state.selectedGameTypes, tags)
            return .merge(actions)
        case .reset:
            state.selectedGameTypes = []
            return .none
        }
    }
}
