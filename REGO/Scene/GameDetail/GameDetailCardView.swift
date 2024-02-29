//
//  GameDetailCardView.swift
//  REGO
//
//  Created by kokojong on 1/29/24.
//

import SwiftUI

struct GameDetailCardView: View {
    @State private var backDegree: Double = -90.00
    @State private var frontDegree: Double = 0.001
    @State private var isFlipped = false
    @State private var isLiked: Bool
    @State private var isShowLottie: Bool = false

    var gameDetail: GameDetail

    init(gameDetail: GameDetail) {
        self.isLiked = gameDetail.like
        self.gameDetail = gameDetail
    }

    let durationAndDelay: CGFloat = 0.2

    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = 90.00
            }
            withAnimation(
                .easeInOut(duration: durationAndDelay).delay(durationAndDelay)){
                    backDegree = 0.001
                }
        }
        else {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90.00
            }

            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 180.001
            }

            frontDegree = 0.001
            backDegree = -90.00
        }
    }

    var body: some View {
        ZStack {
            CardFrontView(
                gameDetail: gameDetail,
                degree: $frontDegree,
                isLiked: $isLiked,
                isShowLottie: $isShowLottie,
                flipFunction: flipCard
            )
            if gameDetail.gameImageExample != nil || gameDetail.gameExample != nil {
                CardBackView(
                    gameDetail: gameDetail,
                    degree: $backDegree,
                    rotation: $isFlipped,
                    isLiked: $isLiked,
                    isShowLottie: $isShowLottie,
                    flipFunction: flipCard
                )
            }
        }
    }
}
