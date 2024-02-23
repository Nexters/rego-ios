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
        var selectedGameTypes: [FilterTag] = []

        var peopleState = GameFilterItemFeature.State(title: "인원 수", allGameTypes: FilterTag.peopleFilters)
        var minState = GameFilterItemFeature.State(title: "소요시간", allGameTypes: FilterTag.timeFilters)
        var useState = GameFilterItemFeature.State(title: "게임 종류", allGameTypes: FilterTag.gameFilters)
        var mcState = GameFilterItemFeature.State(title: "진행자 여부", allGameTypes: FilterTag.mcFilters)
        var materialState = GameFilterItemFeature.State(title: "준비물 여부", allGameTypes: FilterTag.materailFilters)
    }

    enum Action: Equatable {
        case peopleFilter(GameFilterItemFeature.Action)
        case minFilter(GameFilterItemFeature.Action)
        case useFilter(GameFilterItemFeature.Action)
        case mcFilter(GameFilterItemFeature.Action)
        case materialFilter(GameFilterItemFeature.Action)

        case selectGame(FilterTag)
        case reset
    }

    var body: some Reducer<State, Action> {
        Scope(state: \.peopleState, action: /Action.peopleFilter) {
            GameFilterItemFeature()
        }
        Scope(state: \.minState, action: /Action.minFilter) {
            GameFilterItemFeature()
        }
        Scope(state: \.useState, action: /Action.useFilter) {
            GameFilterItemFeature()
        }
        Scope(state: \.mcState, action: /Action.mcFilter) {
            GameFilterItemFeature()
        }
        Scope(state: \.materialState, action: /Action.materialFilter) {
            GameFilterItemFeature()
        }

        Reduce { state, action in
            switch action {
            case .peopleFilter(.selectGameType(let type)):
                return .send(.selectGame(type))
            case .minFilter(.selectGameType(let type)):
                return .send(.selectGame(type))
            case .useFilter(.selectGameType(let type)):
                return .send(.selectGame(type))
            case .mcFilter(.selectGameType(let type)):
                return .send(.selectGame(type))
            case .materialFilter(.selectGameType(let type)):
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
                    .send(.minFilter(.reset)),
                    .send(.useFilter(.reset)),
                    .send(.mcFilter(.reset)),
                    .send(.materialFilter(.reset))
                )
            default:
                return .none
            }
        }
    }
}
