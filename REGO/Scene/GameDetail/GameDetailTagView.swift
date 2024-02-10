//
//  GameDetailTagView.swift
//  REGO
//
//  Created by kokojong on 2/3/24.
//

import SwiftUI

struct GameDetailTagView: View {

    private let tag: Tag

    init(tag: Tag) {
        self.tag = tag
    }

    var body: some View {
        HStack(spacing: 4) {
            tag.image
                .renderingMode(.template)
                .foregroundStyle(.white)
            Text(tag.title)
                .font(RegoFontStyle.body6.font)
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 3)
        .background(tag.bgColor)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

#Preview {
    GameDetailTagView(tag: .두뇌회전)
}
