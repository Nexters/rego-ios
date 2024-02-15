//
//  GameDetailLikeButton.swift
//  REGO
//
//  Created by kokojong on 2/8/24.
//

import SwiftUI

struct GameDetailLikeButton: View {
    @Binding var isLiked: Bool
    @Binding var isShowLottie: Bool

    var body: some View {
        VStack {
            Button(action: {
                isLiked.toggle()
                if isLiked {
                    isShowLottie = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        isShowLottie = false
                    }
                }
                else {
                    isShowLottie = false
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
        }
    }
}

#Preview {
    GameDetailLikeButton(isLiked: .constant(true), isShowLottie: .constant(true))
}
