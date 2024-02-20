//
//  HomeCategoryEnum.swift
//  REGO
//
//  Created by kokojong on 2/20/24.
//

import Foundation

// enum에 따라 HomeListView의 UI가 달라짐
enum HomeCategoryEnum: String {
    case THEME
    case ENTERTAINMENT
    case MATERIALS
    case SPEED
    case MC

    case FILTER // 필터 관련 UI - associated value 쓰고 싶었는데 rawvalue 써서 안댐 ㅜ

    var title: String {
        switch self {
        case .THEME:
            return "테마가 있는 게임"
        case .ENTERTAINMENT:
            return "예능에 나온 게임"
        case .MATERIALS:
            return "준비물 필요한 게임"
        case .SPEED:
            return "스피드 게임"
        case .MC:
            return "땡! 잘하는 진행자 필요한 게임"
        case .FILTER:
            return "게임 둘러보기"
        }
    }
}
