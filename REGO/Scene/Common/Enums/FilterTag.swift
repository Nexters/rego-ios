//
//  FilterTagEnum.swift
//  REGO
//
//  Created by kokojong on 2/20/24.
//

import Foundation

enum FilterTag: String {
    case TWO_FIVE
    case FIVE_TEN
    case NO_LIMIT
    case TEN
    case TWENTY
    case THIRTY
    case USE_BRAIN
    case USE_BODY
    case SPEED
    case NEED_MC
    case NO_NEED_MC
    case NO_NEED_MATERIALS
    case NEED_MATERIAL
//    case SKETCHBOOK
//    case PPT
//    case ETC
//    case MOVIE
//    case DRAMA
//    case SONG
//    case SINSEOUGI
//    case ZIRAKSIL
//    case AHYEONG
//    case RUNNING_MAN

    var title: String {
        switch self {
        case .TWO_FIVE:
            "2-5명"
        case .FIVE_TEN:
            "5-10명"
        case .NO_LIMIT:
            "인원제한 없음"
        case .TEN:
            "10분 이내"
        case .TWENTY:
            "20분 이내"
        case .THIRTY:
            "30분 이내"
        case .USE_BRAIN:
            "두뇌게임"
        case .USE_BODY:
            "신체게임"
        case .SPEED:
            "속도게임"
        case .NEED_MC:
            "진행자 필요"
        case .NO_NEED_MC:
            "진행자 불필요"
        case .NO_NEED_MATERIALS:
            "준비물 불필요"
        case .NEED_MATERIAL:
            "준비물 필요"
        }
    }
}

extension FilterTag {
    static var peopleFilters: [FilterTag] {
        return [.TWO_FIVE, .FIVE_TEN, .NO_LIMIT]
    }

    static var timeFilters: [FilterTag] {
        return [.TEN, .TWENTY, .THIRTY]
    }

    static var gameFilters: [FilterTag] {
        return [.USE_BRAIN, .USE_BODY, .SPEED]
    }

    static var mcFilters: [FilterTag] {
        return [.NEED_MC, .NO_NEED_MC]
    }

    static var materailFilters: [FilterTag] {
        return [.NO_NEED_MATERIALS, .NEED_MATERIAL]
    }

    static var allFilters: [FilterTag] {
        return [.TWO_FIVE, .FIVE_TEN, .NO_LIMIT, .TEN, .TWENTY, .THIRTY, .USE_BRAIN, .USE_BODY, .SPEED, .NEED_MC, .NO_NEED_MC, .NO_NEED_MATERIALS, .NEED_MATERIAL]
    }
}
