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
                title: "스파이는 누구인가 스파이는 누구인가 스파이는 누구인가",
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
        FetchDetailGamesModel(gameUUID: "포스터 조각 보고 맞추기 포스터 조각 보고 맞추기", title: "포스터 조각 보고 맞추기 포스터 조각 보고 맞추기", gameDescription: "포스터 조각만 보고 어떤 영화인지 맞추는 게임", iconType: .SPEED, tag: [.속도가생명, .준비물], tip: "잘못된 정답을 외쳐도 괜찮아요!", uiType: .NARRATIVE_WITH_PROGRESS, like: false, likeCount: 100, gameHow: GameHow(mc: "진행자 설명1", attendee: "참여자 설명1"), gameImageExample: nil, gameExample: nil),
        FetchDetailGamesModel(gameUUID: "스파이는 누구인가", title: "스파이는 누구인가", gameDescription: "한명만 키워드를 모르는 상태에서 돌아가며 키워드와 관련된 한마디를 하는 게임", iconType: .KNOWLEDGE, tag: [.속도가생명, .준비물], tip: "잘못된 정답을 외쳐도 괜찮아요!", uiType: .NARRATIVE_WITHOUT_PROGRESS, like: true, likeCount: 200, gameHow: GameHow(mc: nil, attendee: "참여자 설명1"), gameImageExample: nil, gameExample: nil),
        FetchDetailGamesModel(gameUUID: "바뀐 모습 찾기", title: "바뀐 모습 찾기", gameDescription: "참가자들을 두 개의 그룹으로 나누고, 각 그룹의 팀원들이 서로 바뀐 모습을 찾아내는 게임", iconType: .MISSION, tag: [.두뇌회전], tip: nil, uiType: .IMAGE_TYPE, like: false, likeCount: 300, gameHow: GameHow(mc: "진행자 설명1", attendee: "참여자 설명1"), gameImageExample: GameImageExample(image: "", answer: "정답 예시 1, 아으아, 아으, ㅁㄹ"), gameExample: nil),
        FetchDetailGamesModel(gameUUID: "이어말하기-속담편", title: "이어말하기-속담편", gameDescription: "제시하는 속담에 맞춰 뒷문장을 이어 말하는 게임", iconType: .MISSION, tag: [.두뇌회전, .준비물, .진행자, .팀대항전], tip: "팁팁팁입니다아", uiType: .TEXT_TYPE, like: true, likeCount: 400, gameHow: GameHow(mc: "게임 전, 속담 모음을 준비해야 해요. 게임을 진행하며 참여자에게 순차적으로 앞문장을 제시해요.", attendee: "진행자가 제시하는 앞문장을 듣고 뒷문장을 이어말해요."), gameImageExample: nil, gameExample: ["어쩌고 저쩌고 속담", "어쩌고 저쩌고고 소소소소속다암앙ㅁ", "어쩌고 저쩌고고 속담말고 최담(?)"])

    ]
}
