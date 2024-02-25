//
//  TagEnum.swift
//  REGO
//
//  Created by kokojong on 2/3/24.
//

import Foundation
import SwiftUI

enum Tag: String, Codable {
    case 두뇌회전
    case 속도가생명
    case 팀대항전
    case 준비물
    case 진행자
    case 신체사용

    var title: String {
        switch self {
        case .속도가생명:
            return "속도가 생명"
        default:
            return String(describing: self)
        }
    }

    var image: Image {
        switch self {
        case .두뇌회전:
            return .init(.icon24Smart)
        case .속도가생명:
            return .init(.icon24Timer)
        case .팀대항전:
            return .init(.icon24User03)
        case .준비물:
            return .init(.icon24Box)
        case .진행자:
            return .init(.icon24User01)
        case .신체사용:
            return .init(.icon24Walking)
        }
    }

    var bgColor: Color {
        switch self {
        case .두뇌회전:
            return Color(uiColor: .blue50)
        case .속도가생명:
            return Color(uiColor: .skyBlue50)
        case .팀대항전:
            return Color(uiColor: .coral50)
        case .준비물:
            return Color(uiColor: .purple50)
        case .진행자:
            return Color(uiColor: .orange50)
        case .신체사용:
            return Color(uiColor: .green50)
        }
    }
}
