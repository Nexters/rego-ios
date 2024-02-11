//
//  API Model.swift
//  REGO
//
//  Created by kokojong on 2/11/24.
//

import Foundation

// MARK: - FetchGamesModel
struct FetchGamesModel {
    let popularGames: [PopularGame]
    let allGames: [AllGame]
}

// MARK: - AllGame
struct AllGame {
    let category: String? = nil
    let info: [PopularGame]
}

// MARK: - PopularGame
struct PopularGame {
    let gameUUID, title: String
    let gameSummary: GameSummary
    let like: Int
    let iconType: IconType
    let rank: Int?
}

// MARK: - GameSummary
struct GameSummary {
    let gameTime, gamePeople: String
}

struct FetchDetailGamesModel {
    let gameUUID, title: String
    let gameDescription: String
    // TODO: Enum화
    let iconType: String
    let tag: String
    let tip: String? = nil
    let uiType: String
    let like: Bool
    let likeCount: Int

    // 이미지형, 설명문형, 텍스트형
    let gameHow: GameHow? = nil
    let gameExample: GameExample? = nil
    let gameExamples: [String]? = nil
}

struct GameHow {
    let facilitator: String?
    let attendee: String
}

struct GameExample {
    let image: String
    let answer: String
}

enum IconType: String {
    case ACTIVE
    case SONG
    case SPEED
    case TASTE
    case TOUCH
    case BODY // TODO: 신체사용에 맞춰 수정하기
    case KNOWLEDGE
    case MISSION
}
