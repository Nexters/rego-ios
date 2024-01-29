//
//  Labels.swift
//  REGO
//
//  Created by 최모지 on 1/29/24.
//

import UIKit

final class RegoLabel: UILabel {
    var style: RegoFontStyle?
    
    convenience init(style: RegoFontStyle) {
        self.init(frame: .zero)
        self.style = style
        self.font = style.font
    }
    
    convenience init(style: RegoFontStyle, text: String, textColor: UIColor) {
        self.init(frame: .zero)
        self.style = style
        self.font = style.font
        self.text = text
        self.textColor = textColor
    }
    
    convenience init(style: RegoFontStyle, textColor: UIColor) {
        self.init(frame: .zero)
        self.style = style
        self.font = style.font
        self.textColor = textColor
    }
    
    convenience init(style: RegoFontStyle, text: String) {
        self.init(frame: .zero)
        self.style = style
        self.font = style.font
        self.text = text
    }
}

