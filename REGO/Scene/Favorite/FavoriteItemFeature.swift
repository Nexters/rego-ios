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
    struct State: Equatable {
        var title: String
        var isSelected: Bool = false
    }

    enum Action: Equatable {
        case selectItem
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .selectItem:
            state.isSelected.toggle()
            return .none
        }
    }
}
