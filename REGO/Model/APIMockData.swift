//
//  APIMockData.swift
//  REGO
//
//  Created by kokojong on 2/11/24.
//

import Foundation

struct Mock {
    static let fetchGamesMock = FetchGamesModel(userLikeCount: 10, games: [
        Game(category: "인기", data: [
            GameData(gameUUID: 100, title: "스파이는 누구인가", rank: 1, gameSummary: GameSummary(gameTime: "20m", gamePeople: "5-10명"), likeCount: 1000, iconType: .KNOWLEDGE, like: false),
            GameData(gameUUID: 101, title: "바뀐 모습 찾기", rank: 2, gameSummary: GameSummary(gameTime: "20m", gamePeople: "5-10명"), likeCount: 999, iconType: .SPEED, like: false),
            GameData(gameUUID: 502, title: "가짜 음식을 먹은 사람 맞추기", rank: 3, gameSummary: GameSummary(gameTime: "10m", gamePeople: "5-10명"), likeCount: 990, iconType: .TASTE, like: false),
            GameData(gameUUID: 503, title: "행동지령하게 하기", rank: 4, gameSummary: GameSummary(gameTime: "20m", gamePeople: "5-10명"), likeCount: 90, iconType: .MISSION, like: false),
            GameData(gameUUID: 504, title: "좀비 게임", rank: 2, gameSummary: GameSummary(gameTime: "10m", gamePeople: "5-10명"), likeCount: 10, iconType: .ACTIVE, like: false)
        ]),
        Game(category: "신서유기", data: [
            GameData(gameUUID: 600, title: "스파이는 누구인가", rank: nil, gameSummary: GameSummary(gameTime: "20m", gamePeople: "5-10명"), likeCount: 1000, iconType: .KNOWLEDGE, like: false),
            GameData(gameUUID: 601, title: "바뀐 모습 찾기", rank: nil, gameSummary: GameSummary(gameTime: "20m", gamePeople: "5-10명"), likeCount: 999, iconType: .SPEED, like: false),
            GameData(gameUUID: 602, title: "가짜 음식을 먹은 사람 맞추기", rank: nil, gameSummary: GameSummary(gameTime: "10m", gamePeople: "5-10명"), likeCount: 990, iconType: .TASTE, like: false),
            GameData(gameUUID: 603, title: "행동지령하게 하기", rank: nil, gameSummary: GameSummary(gameTime: "20m", gamePeople: "5-10명"), likeCount: 90, iconType: .MISSION, like: false),
            GameData(gameUUID: 604, title: "좀비 게임", rank: nil, gameSummary: GameSummary(gameTime: "10m", gamePeople: "5-10명"), likeCount: 10, iconType: .ACTIVE, like: false)
        ])
    ])

    static let detailGameMock: FetchDetailModel = FetchDetailModel(userCountLike: 5, games: [
        GameDetail(gameUUID: 100, title: "포스터 조각 보고 맞추기", gameDescription: "포스터 조각만 보고 어떤 영화인지 맞추는 게임", iconType: .SPEED, tag: [.속도가생명, .진행자], uiType: .NO_EXAMPLE, gameHow: GameHow(mc: "진행자 설명명명명", attendee: "참여자 설명명염영"), gameImageExample: nil, gameExample: nil, like: false, tip: nil),
        GameDetail(gameUUID: 101, title: "포스터 조각 보고 맞추기 포스터 조각 보고 맞추기", gameDescription: "포스터 조각만 보고 어떤 영화인지 맞추는 게임", iconType: .SPEED, tag: [.속도가생명, .진행자], uiType: .NO_EXAMPLE, gameHow: GameHow(mc: "진행자 설명명명명", attendee: "참여자 설명명염영"), gameImageExample: nil, gameExample: nil, like: false, tip: nil),
        GameDetail(gameUUID: 102, title: "스파이는 누구인가", gameDescription: "한명만 키워드를 모르는 상태에서 돌아가며 키워드와 관련된 한마디를 하는 게임", iconType: .KNOWLEDGE, tag: [.두뇌회전, .준비물, .팀대항전], uiType: .NO_EXAMPLE, gameHow: GameHow(mc: nil, attendee: "참여자자자자자자자자ㅏㅈ자ㅏㅏㅏㅏ"), gameImageExample: nil, gameExample: nil, like: true, tip: "팁팁팁티티팉ㅂ"),
        GameDetail(gameUUID: 103, title: "바뀐 모습 찾기", gameDescription: "참가자들을 두 개의 그룹으로 나누고, 각 그룹의 팀원들이 서로 바뀐 모습을 찾아내는 게임", iconType: .MISSION, tag: [.두뇌회전, .팀대항전], uiType: .IMAGE_EXAMPLE, gameHow: GameHow(mc: "진행자가 어떻게 해줄까요", attendee: "참여자는 머할까요요용"), gameImageExample: GameImageExample(image: "imageExample", answer: "정답답ㄷ받ㅂ답"), gameExample: nil, like: false, tip: "잘못된 정답을 말해도 괜찮아요"),
        GameDetail(gameUUID: 104, title: "이어말하기-속담편", gameDescription: "제시하는 속담에 맞춰 뒷문장을 이어 말하는 게임", iconType: .MISSION, tag: [.두뇌회전, .준비물, .진행자, .팀대항전], uiType: .TEXT_EXAMPLE, gameHow: GameHow(mc: "게임 전, 속담 모음을 준비해야 해요. 게임을 진행하며 참여자에게 순차적으로 앞문장을 제시해요.", attendee: "진행자가 제시하는 앞문장을 듣고 뒷문장을 이어말해요."), gameImageExample: nil, gameExample: ["어쩌고 저쩌고 속담", "어쩌고 저쩌고고 소소소소속다암앙ㅁ", "어쩌고 저쩌고고 속담말고 최담(?)"], like: false, tip: "속담 팁팁")
    ])
}
