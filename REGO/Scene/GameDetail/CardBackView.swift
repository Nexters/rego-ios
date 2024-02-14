//
//  CardBackView.swift
//  REGO
//
//  Created by kokojong on 2/14/24.
//

import SwiftUI

struct CardBackView: View {
    @Binding var degree: Double
    @Binding var rotation: Bool
    @Binding var isLiked: Bool
    @Binding var isShowLottie: Bool

    var flipFunction: () -> Void

    var gameDetail: FetchDetailGamesModel

    init(gameDetail: FetchDetailGamesModel, degree: Binding<Double>, rotation: Binding<Bool>, isLiked: Binding<Bool>, isShowLottie: Binding<Bool>, flipFunction: @escaping () -> Void) {
        self._degree = degree
        self._isLiked = isLiked
        self._rotation = rotation
        self._isShowLottie = isShowLottie
        self.gameDetail = gameDetail
        self.flipFunction = flipFunction
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(.linearGradient(.init(colors: [.homeGradientTop, .homeGradientBottom]), startPoint: .top, endPoint: .bottom))

            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        gameDetail.iconType.image
                            .resizable()
                            .frame(width: 36, height: 36)
                            .background {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(gameDetail.iconType.bgColor)
                            }
                        H3Text(gameDetail.title)
                        Spacer()
                        GameDetailLikeButton(isLiked: $isLiked, isShowLottie: $isShowLottie)
                    }
                }
                Spacer().frame(height: 20)
                Subtitle3Text("게임방법")
                Spacer()
                Button(action: {
                    self.flipFunction()
                }, label: {
                    Subtitle4Text("예시보기")
                        .frame(maxWidth: .infinity, maxHeight: 46)
                        .clipShape(.rect(cornerRadius: 12))
                        .foregroundStyle(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(Color.gray900)
                        )
                })
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 24)
            .rotation3DEffect(
                .degrees(rotation ? 0.01 : 180.01),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )

            if isShowLottie {
                LottieView(filename: "like_big_lottie", loopMode: .playOnce)
                    .frame(width: 120, height: 120)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.purple50, lineWidth: 1)
        )
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))

    }
}
