//
//  LikeButtonView.swift
//  REGO
//
//  Created by kokojong on 1/28/24.
//

import SwiftUI

struct LikeButtonView: View {

    @Binding var isLiked: Bool
    @Binding var likeCnt: Int

    var body: some View {
        VStack(spacing: -2) {
            Button(action: {
                isLiked.toggle()
                if isLiked {
                    likeCnt += 1
                }
                else {
                    likeCnt -= 1
                }
            }, label: {
                ZStack {
                    Image(.icon24Liked)
                        .frame(width: 24, height: 24)
                        .foregroundStyle(isLiked ? Color(.primary500) : Color(.gray200))
                    if isLiked {
                        LottieView(filename: "like_small_lottie", loopMode: .playOnce)
                            .frame(width: 24, height: 24)
                    }
                }
            })
            Text(likeCnt > 999 ? "+999" : "\(likeCnt)")
                .font(RegoFontStyle.body7.font)
                .foregroundStyle(isLiked ? Color(.primary500) : Color(.gray200))
        }
    }
}

#Preview {
    LikeButtonView(isLiked: .constant(false), likeCnt: .constant(100))
}
