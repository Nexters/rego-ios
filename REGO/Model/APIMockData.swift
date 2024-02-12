//
//  APIMockData.swift
//  REGO
//
//  Created by kokojong on 2/11/24.
//

import Foundation

let Mock = FetchGamesModel(
    popularGames: [
        GameInfo(
            gameUUID: "스파이는 누구인가",
            title: "스파이는 누구인가",
            gameSummary: GameSummary(gameTime: "20m", gamePeople: "5-10명"),
            like: 1000,
            iconType: .KNOWLEDGE,
            rank: 1),
        GameInfo(
            gameUUID: "바뀐 모습 찾기",
            title: "바뀐 모습 찾기",
            gameSummary: GameSummary(gameTime: "10m", gamePeople: "5-10명"),
            like: 999,
            iconType: .SPEED,
            rank: 2),
        GameInfo(
            gameUUID: "가짜 음식을 먹은 사람 맞추기",
            title: "가짜 음식을 먹은 사람 맞추기",
            gameSummary: GameSummary(gameTime: "10m", gamePeople: "5-10명"),
            like: 500,
            iconType: .TASTE,
            rank: 3),
        GameInfo(
            gameUUID: "행동지령하게 하기",
            title: "행동지령하게 하기",
            gameSummary: GameSummary(gameTime: "20m", gamePeople: "5-10명"),
            like: 400,
            iconType: .MISSION,
            rank: 4),
        GameInfo(
            gameUUID: "좀비 게임",
            title: "좀비 게임",
            gameSummary: GameSummary(gameTime: "10m", gamePeople: "5-10명"),
            like: 300,
            iconType: .ACTIVE,
            rank: 5)
    ],
    allGames: [
        AllGame(info: [
            GameInfo(gameUUID: "", title: "영화 소리만 듣고 맞추기", gameSummary: GameSummary(gameTime: "20m", gamePeople: "2-5명"), like: 10, iconType: .SPEED, rank: nil),
            GameInfo(gameUUID: "", title: "영화 소리만 듣고 맞추기", gameSummary: GameSummary(gameTime: "20m", gamePeople: "2-5명"), like: 10, iconType: .SPEED, rank: nil),
            GameInfo(gameUUID: "", title: "영화 소리만 듣고 맞추기", gameSummary: GameSummary(gameTime: "20m", gamePeople: "2-5명"), like: 10, iconType: .SPEED, rank: nil),
            GameInfo(gameUUID: "", title: "영화 소리만 듣고 맞추기", gameSummary: GameSummary(gameTime: "20m", gamePeople: "2-5명"), like: 10, iconType: .SPEED, rank: nil),
            GameInfo(gameUUID: "", title: "영화 소리만 듣고 맞추기", gameSummary: GameSummary(gameTime: "20m", gamePeople: "2-5명"), like: 10, iconType: .SPEED, rank: nil),
            GameInfo(gameUUID: "", title: "영화 소리만 듣고 맞추기", gameSummary: GameSummary(gameTime: "20m", gamePeople: "2-5명"), like: 10, iconType: .SPEED, rank: nil)
        ])
    ]
)
