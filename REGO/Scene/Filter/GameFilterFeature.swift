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

        var filter1State = GameFilterItemFeature.State(title: "인원 수", allGameTypes: GameType.peopleTypes) // TODO: 네이밍 수정
    }

    enum Action: Equatable {
        case filter1(GameFilterItemFeature.Action)
        case reset
    }

    var body: some Reducer<State, Action> {
        Scope(state: \.filter1State, action: /Action.filter1) {
            GameFilterItemFeature()
        }

        Reduce { state, action in
            switch action {
            case .filter1(.selectGameType(let type)):
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
                state.filter1State.selectedGameTypes = []
                return .none
            default:
                return .none
            }
        }
    }
}
