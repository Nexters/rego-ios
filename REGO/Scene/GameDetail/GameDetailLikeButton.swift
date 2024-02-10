//
//  GameDetailLikeButton.swift
//  REGO
//
//  Created by kokojong on 2/8/24.
//

import SwiftUI

struct GameDetailLikeButton: View {
    @Binding var isLiked: Bool

    var body: some View {
        Button(action: {
            isLiked.toggle()
        }, label: {
            Image(.icon24Liked)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(isLiked ? Color(.primary500) : Color(.gray200))
        })
    }
}

#Preview {
    GameDetailLikeButton(isLiked: .constant(true))
}
