//
//  UIColor+Extensions.swift
//  REGO
//
//  Created by 최모지 on 1/27/24.
//

import UIKit

extension UIColor {
    var rgba: Int {
        get {
            var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0, alpha: CGFloat = 0.0
            self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

            return Int(red * 255.0) << 24 | Int(green * 255.0) << 16 | Int(blue * 255.0) << 8 | Int(alpha * 255.0)
        }
    }

    var alpha: CGFloat {
        get {
            return CGFloat(self.rgba & 0xFF) / 255.0
        }
    }

    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = (CGFloat((hex & 0xff0000) >> 16) / 255.0)
        let green = (CGFloat((hex & 0x00ff00) >> 8) / 255.0)
        let blue = (CGFloat(hex & 0x0000ff) / 255.0)
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UIColor {
    /// white color
    static let whiteColor = UIColor(hex: 0xffffff)

    /// gray color
    static let gray100 = UIColor(hex: 0xffffff, alpha: 0.90)
    static let gray200 = UIColor(hex: 0xffffff, alpha: 0.75)
    static let gray300 = UIColor(hex: 0xffffff, alpha: 0.60)
    static let gray400 = UIColor(hex: 0xffffff, alpha: 0.40)
    static let gray500 = UIColor(hex: 0xffffff, alpha: 0.25)
    static let gray600 = UIColor(hex: 0xffffff, alpha: 0.15)
    static let gray700 = UIColor(hex: 0xffffff, alpha: 0.10)
    static let gray800 = UIColor(hex: 0x272939)
    static let gray900 = UIColor(hex: 0x0c0e20)

    /// primary color
    static let primary100 = UIColor(hex: 0xFFDFD2)
    static let primary200 = UIColor(hex: 0xFFC0A5)
    static let primary300 = UIColor(hex: 0xFFA179)
    static let primary400 = UIColor(hex: 0xFF814C)
    static let primary500 = UIColor(hex: 0xFF621F)
    static let primary600 = UIColor(hex: 0xD4521A)
    static let primary700 = UIColor(hex: 0xAA4115)
    static let primary800 = UIColor(hex: 0x80310F)
    static let primary900 = UIColor(hex: 0x55210A)

    /// sub colors
    static let green15 = UIColor(hex: 0xAFE048, alpha: 0.15)
    static let green50 = UIColor(hex: 0xAFE048, alpha: 0.50)
    static let green100 = UIColor(hex: 0xAFE048)

    static let skyBlue15 = UIColor(hex: 0x19D8FF, alpha: 0.15)
    static let skyBlue50 = UIColor(hex: 0x19D8FF, alpha: 0.50)
    static let skyBlue100 = UIColor(hex: 0x19D8FF)

    static let blue15 = UIColor(hex: 0x389FFF, alpha: 0.15)
    static let blue50 = UIColor(hex: 0x389FFF, alpha: 0.50)
    static let blue100 = UIColor(hex: 0x389FFF)

    static let yellow15 = UIColor(hex: 0xFFAA04, alpha: 0.15)
    static let yellow50 = UIColor(hex: 0xFFAA04, alpha: 0.50)
    static let yellow100 = UIColor(hex: 0xFFAA04)

    static let coral15 = UIColor(hex: 0xFF5E67, alpha: 0.15)
    static let coral50 = UIColor(hex: 0xFF5E67, alpha: 0.50)
    static let coral100 = UIColor(hex: 0xFF5E67)

    static let purple15 = UIColor(hex: 0x7675FF, alpha: 0.15)
    static let purple50 = UIColor(hex: 0x7675FF, alpha: 0.50)
    static let purple100 = UIColor(hex: 0x7675FF)
}
