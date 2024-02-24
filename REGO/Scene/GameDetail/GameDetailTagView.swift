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
                .resizable()
                .frame(width: 14, height: 14)
                .foregroundStyle(.white)
            Body6Text(tag.title)
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
