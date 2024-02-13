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

        var peopleFilterState = GameFilterItemFeature.State(title: "인원 수", allGameTypes: GameType.peopleTypes)
        var minFilterState = GameFilterItemFeature.State(title: "소요시간", allGameTypes: GameType.minuateTypes)
    }

    enum Action: Equatable {
        case peopleFilter(GameFilterItemFeature.Action)
        case minFilter(GameFilterItemFeature.Action)

        case selectGame(GameType)
        case reset
    }

    var body: some Reducer<State, Action> {
        Scope(state: \.peopleFilterState, action: /Action.peopleFilter) {
            GameFilterItemFeature()
        }
        Scope(state: \.minFilterState, action: /Action.minFilter) {
            GameFilterItemFeature()
        }

        Reduce { state, action in
            switch action {
            case .peopleFilter(.selectGameType(let type)):
                return .send(.selectGame(type))
            case .minFilter(.selectGameType(let type)):
                return .send(.selectGame(type))
            case .selectGame(let type):
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
                return .merge(
                    .send(.peopleFilter(.reset)),
                    .send(.minFilter(.reset))
                )
            default:
                return .none
            }
        }
    }
}
