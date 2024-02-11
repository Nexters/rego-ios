//
//  APIMockData.swift
//  REGO
//
//  Created by kokojong on 2/11/24.
//

import Foundation

let Mock = FetchGamesModel(
    popularGames: [
        PopularGame(
            gameUUID: "",
            title: "스파이는 누구인가",
            gameSummary: GameSummary(gameTime: "20m", gamePeople: "5-10명"),
            like: 1000,
            iconType: .KNOWLEDGE,
            rank: 1),
        PopularGame(
            gameUUID: "",
            title: "바뀐 모습 찾기",
            gameSummary: GameSummary(gameTime: "10m", gamePeople: "5-10명"),
            like: 999,
            iconType: .SPEED,
            rank: 2),
        PopularGame(
            gameUUID: "",
            title: "가짜 음식을 먹은 사람 맞추기",
            gameSummary: GameSummary(gameTime: "10m", gamePeople: "5-10명"),
            like: 500,
            iconType: .TASTE,
            rank: 3),
        PopularGame(
            gameUUID: "",
            title: "행동지령하게 하기",
            gameSummary: GameSummary(gameTime: "20m", gamePeople: "5-10명"),
            like: 400,
            iconType: .MISSION,
            rank: 4),
        PopularGame(
            gameUUID: "",
            title: "좀비 게임",
            gameSummary: GameSummary(gameTime: "10m", gamePeople: "5-10명"),
            like: 300,
            iconType: .ACTIVE,
            rank: 5)
    ],
    allGames: [
        AllGame(info: [
            PopularGame(gameUUID: "", title: "영화 소리만 듣고 맞추기", gameSummary: GameSummary(gameTime: "20m", gamePeople: "2-5명"), like: 10, iconType: .SPEED, rank: nil),
            PopularGame(gameUUID: "", title: "영화 소리만 듣고 맞추기", gameSummary: GameSummary(gameTime: "20m", gamePeople: "2-5명"), like: 10, iconType: .SPEED, rank: nil),
            PopularGame(gameUUID: "", title: "영화 소리만 듣고 맞추기", gameSummary: GameSummary(gameTime: "20m", gamePeople: "2-5명"), like: 10, iconType: .SPEED, rank: nil),
            PopularGame(gameUUID: "", title: "영화 소리만 듣고 맞추기", gameSummary: GameSummary(gameTime: "20m", gamePeople: "2-5명"), like: 10, iconType: .SPEED, rank: nil),
            PopularGame(gameUUID: "", title: "영화 소리만 듣고 맞추기", gameSummary: GameSummary(gameTime: "20m", gamePeople: "2-5명"), like: 10, iconType: .SPEED, rank: nil),
            PopularGame(gameUUID: "", title: "영화 소리만 듣고 맞추기", gameSummary: GameSummary(gameTime: "20m", gamePeople: "2-5명"), like: 10, iconType: .SPEED, rank: nil)
        ])
    ]
)
