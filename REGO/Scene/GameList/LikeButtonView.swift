//
//  LikeButtonView.swift
//  REGO
//
//  Created by kokojong on 1/28/24.
//

import SwiftUI

struct LikeButtonView: View {

    @Binding var isLiked: Bool

    var body: some View {
        Button(action: {
            isLiked.toggle()
        }, label: {
            Image(.icon24Liked)
                .foregroundStyle(isLiked ? .red : .white)
        })
    }
}

#Preview {
    LikeButtonView(isLiked: .constant(false))
}
