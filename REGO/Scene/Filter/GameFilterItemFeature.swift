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
        var allGameTypes: [GameType]
        var selectedGameTypes: [GameType] = []
    }

    enum Action: Equatable {
        case selectGameType(GameType)
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

/// 게임 타입 테스트를 위한 임시 데이터 입니다.

enum GameType: String {
    // 인원 수
    case twoFivePeople = "two-five-people"
    case fiveTenPeople = "five-ten-people"
    case noLimitPeople = "no-limit-people"

    // 소요 시간
    case minuate10 = "10m"
    case minuate20 = "20m"
    case minuate30 = "30m"

    // 게임 종류
    case useBrain = "use-brain"
    case useBody = "use-body"
    case speed = "speed"

    // 진행자 여부
    case needMc = "need-mc"
    case noNeedMc = "no-need-mc"

    // 준비물 여부
    case noNeedMaterials = "no-need-materials"
    case schetchbook = "schetchbook"
    case ppt = "ppt"
    case etcMaterials = "etc-materials"

    // 예능
    case sinseougi = "sinseougi"
    case ziraksil = "ziraksil"
    case ahyeong = "ahyeong"
    case runningMan = "running-man"
}

extension GameType {
    var title: String {
        switch self {
        case .twoFivePeople:
            return "2~5명"
        case .fiveTenPeople:
            return "5~10명"
        case .noLimitPeople:
            return "인원제한 없음"
        case .minuate10:
            return "10분 이내"
        case .minuate20:
            return "20분 이내"
        case .minuate30:
            return "30분 이내"
        case .useBrain:
            return "두뇌게임"
        case .useBody:
            return "신체게임"
        case .speed:
            return "속도게임"
        case .needMc:
            return "진행자 필요"
        case .noNeedMc:
            return "진행자 불필요"
        case .noNeedMaterials:
            return "준비물 불필요"
        case .schetchbook:
            return "스케치북"
        case .ppt:
            return "피피티"
        case .etcMaterials:
            return "기타 재료"
        case .sinseougi:
            return "신서유기"
        case .ziraksil:
            return "지락실"
        case .ahyeong:
            return "아는형님"
        case .runningMan:
            return "런닝맨"
        }
    }
}

extension GameType {
    static var peopleTypes: [GameType] {
        return [.twoFivePeople, .fiveTenPeople, .noLimitPeople]
    }

    static var minuateTypes: [GameType] {
        return [.minuate10, .minuate20, .minuate30]
    }

    static var useTypes: [GameType] {
        return [.useBrain, .useBody, .speed]
    }

    static var mcTypes: [GameType] {
        return [.needMc, .noNeedMc]
    }

    static var materialTypes: [GameType] {
        return [.noNeedMaterials, .schetchbook, .ppt, .etcMaterials]
    }

    static var needMaterialsTypes: [GameType] {
        return [.schetchbook, .ppt, .etcMaterials]
    }

    static var tvShowsTypes: [GameType] {
        return [.sinseougi, .ziraksil, .ahyeong, .runningMan]
    }
}
