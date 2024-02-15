//
//  APIMockData.swift
//  REGO
//
//  Created by kokojong on 2/11/24.
//

import Foundation

struct Mock {
    static let fetchGamesMock = FetchGamesModel(
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
                GameInfo(gameUUID: "영화 소리만 듣고 맞추기1", title: "영화 소리만 듣고 맞추기1", gameSummary: GameSummary(gameTime: "20m", gamePeople: "2-5명"), like: 10, iconType: .SPEED, rank: nil),
                GameInfo(gameUUID: "영화 소리만 듣고 맞추기2", title: "영화 소리만 듣고 맞추기2", gameSummary: GameSummary(gameTime: "20m", gamePeople: "2-5명"), like: 11, iconType: .SPEED, rank: nil),
                GameInfo(gameUUID: "영화 소리만 듣고 맞추기3", title: "영화 소리만 듣고 맞추기3", gameSummary: GameSummary(gameTime: "20m", gamePeople: "2-5명"), like: 12, iconType: .SPEED, rank: nil),
                GameInfo(gameUUID: "영화 소리만 듣고 맞추기4", title: "영화 소리만 듣고 맞추기4", gameSummary: GameSummary(gameTime: "20m", gamePeople: "2-5명"), like: 13, iconType: .SPEED, rank: nil),
                GameInfo(gameUUID: "영화 소리만 듣고 맞추기5", title: "영화 소리만 듣고 맞추기5", gameSummary: GameSummary(gameTime: "20m", gamePeople: "2-5명"), like: 14, iconType: .SPEED, rank: nil),
                GameInfo(gameUUID: "영화 소리만 듣고 맞추기6", title: "영화 소리만 듣고 맞추기6", gameSummary: GameSummary(gameTime: "20m", gamePeople: "2-5명"), like: 15, iconType: .SPEED, rank: nil)
            ])
        ]
    )

   static let detailGameMock: [FetchDetailGamesModel] = [
        FetchDetailGamesModel(gameUUID: "포스터 조각 보고 맞추기", title: "포스터 조각 보고 맞추기", gameDescription: "포스터 조각만 보고 어떤 영화인지 맞추는 게임", iconType: .SPEED, tag: [.속도가생명, .준비물], uiType: .NARRATIVE_WITH_PROGRESS, like: false, likeCount: 100),
        FetchDetailGamesModel(gameUUID: "스파이는 누구인가", title: "스파이는 누구인가", gameDescription: "한명만 키워드를 모르는 상태에서 돌아가며 키워드와 관련된 한마디를 하는 게임", iconType: .KNOWLEDGE, tag: [.속도가생명], uiType: .NARRATIVE_WITHOUT_PROGRESS, like: true, likeCount: 200),
        FetchDetailGamesModel(gameUUID: "바뀐 모습 찾기", title: "바뀐 모습 찾기", gameDescription: "참가자들을 두 개의 그룹으로 나누고, 각 그룹의 팀원들이 서로 바뀐 모습을 찾아내는 게임", iconType: .MISSION, tag: [.두뇌회전], uiType: .IMAGE_TYPE, like: false, likeCount: 300),
        FetchDetailGamesModel(gameUUID: "포스터 조각 보고 맞추기", title: "포스터 조각 보고 맞추기", gameDescription: "포스터 조각만 보고 어떤 영화인지 맞추는 게임", iconType: .SONG, tag: [.속도가생명, .팀대항전, .준비물, .진행자], uiType: .TEXT_TYPE, like: true, likeCount: 400)

    ]
}
