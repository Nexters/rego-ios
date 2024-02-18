//
//  API Model.swift
//  REGO
//
//  Created by kokojong on 2/11/24.
//

import Foundation
import SwiftUI

// MARK: - FetchGamesModel
struct FetchGamesModel {
    let popularGames: [GameInfo]
    let allGames: [AllGame]
}

// MARK: - AllGame
struct AllGame {
    let category: String?
    let info: [GameInfo]
}

// MARK: - PopularGame
struct GameInfo: Identifiable {
    let gameUUID, title: String
    let gameSummary: GameSummary
    let like: Int
    let iconType: IconType
    let rank: Int?

    var id: String {
        return gameUUID
    }
}

// MARK: - GameSummary
struct GameSummary {
    let gameTime, gamePeople: String
}

struct FetchDetailGamesModel {
    let gameUUID, title: String
    let gameDescription: String
    // TODO: Enum화
    let iconType: IconType
    let tag: [TagEnum] // TODO: Enum수정, BE Model 수정 요청
    let tip: String?
    let uiType: UIType
    let like: Bool
    let likeCount: Int

    // 이미지형, 설명문형, 텍스트형
    let gameHow: GameHow?
    let gameImageExample: GameImageExample?
    let gameExample: [String]?
}

enum UIType: String {
    case IMAGE_TYPE
    case NARRATIVE_WITH_PROGRESS
    case NARRATIVE_WITHOUT_PROGRESS
    case TEXT_TYPE
}

struct GameHow {
    let mc: String?
    let attendee: String
}

struct GameImageExample {
    let image: String
    let answer: String
}

enum IconType: String {
    case ACTIVE
    case SONG
    case SPEED
    case TASTE
    case TOUCH
    case KNOWLEDGE
    case MISSION

    var image: Image {
        switch self {
        case .ACTIVE:
            return Image(._3DActive)
        case .SONG:
            return Image(._3DSong)
        case .SPEED:
            return Image(._3DSpeed)
        case .TASTE:
            return Image(._3DTaste)
        case .TOUCH:
            return Image(._3DTouch)
        case .KNOWLEDGE:
            return Image(._3DKnowledge)
        case .MISSION:
            return Image(._3DMission)
        }
    }

    var bgColor: Color {
        switch self {
        case .ACTIVE:
            return .green15
        case .SONG:
            return .orange15
        case .SPEED:
            return .skyBlue15
        case .TASTE:
            return .orange15
        case .TOUCH:
            return .yellow15
        case .KNOWLEDGE:
            return .blue15
        case .MISSION:
            return .coral15
        }
    }
}
