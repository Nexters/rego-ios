//
//  API Model.swift
//  REGO
//
//  Created by kokojong on 2/11/24.
//

import Foundation
import SwiftUI

// MARK: - FetchGamesModel
struct FetchGamesModel: Codable {
    let userLikeCount: Int64
    let games: [Game]
}

// MARK: - Game
struct Game: Codable {
    let category: String
    let data: [GameData]
}

// MARK: - GameData
struct GameData: Codable, Identifiable, Equatable {
    static func == (lhs: GameData, rhs: GameData) -> Bool {
        lhs.gameUuid == rhs.gameUuid
    }

    let gameUuid: Int64
    let title: String
    let rank: Int?
    let gameSummary: GameSummary
    let likeCount: Int64
    let iconType: IconType
    let like: Bool

    var id: Int64 {
        return gameUuid
    }
}

// MARK: - GameSummary
struct GameSummary: Codable {
    let gameTime, gamePeople: String
}

struct FetchDetailModel: Codable {
    let userCountLike: Int64
    let games: [GameDetail]
}

// MARK: - Game
struct GameDetail: Codable {
    let gameUuid: Int64
    let title, gameDescription: String
    let iconType: IconType
    let tag: [TagEnum]
    let uiType: UIType
    let gameHow: GameHow
    let gameImageExample: GameImageExample?
    let gameExample: [String]?
    let like: Bool
    let tip: String?
}

enum UIType: String, Codable {
    case NO_EXAMPLE
    case TEXT_EXAMPLE
    case IMAGE_EXAMPLE
}

struct GameHow: Codable {
    let mc: String?
    let attendee: String
}

struct GameImageExample: Codable {
    let image: String // Image URL
    let answer: String
}

enum IconType: String, Codable {
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

// MARK: 관심 게임
struct LikeGames: Codable {
    let like: [LikeGame]
}

struct LikeGame: Codable, Equatable {
    let heartID, gameUuid: Int64
    let iconType: IconType
    let title: String
}
