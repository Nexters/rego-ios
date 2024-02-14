//
//  GameDetailCardView.swift
//  REGO
//
//  Created by kokojong on 1/29/24.
//

import SwiftUI

struct GameDetailCardView: View {
    @State private var backDegree: Double = -90.01
    @State private var frontDegree: Double = 0.01
    @State private var isFlipped = false
    @State private var isLiked: Bool
    @State private var isShowLottie: Bool = false

    var gameDetail: FetchDetailGamesModel

    init(gameDetail: FetchDetailGamesModel) {
        self.isLiked = gameDetail.like
        self.gameDetail = gameDetail
    }

    let durationAndDelay: CGFloat = 0.2

    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = 90.01
            }
            withAnimation(
                .easeInOut(duration: durationAndDelay).delay(durationAndDelay)){
                    backDegree = 0.01
                }
        }
        else {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90.01
            }

            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 180.01
            }

            frontDegree = 0.01
            backDegree = -90.01
        }
    }

    var body: some View {
        ZStack {
            CardFrontView(gameDetail: gameDetail, degree: $frontDegree, isLiked: $isLiked, isShowLottie: $isShowLottie, flipFunction: flipCard)
            CardBackView(gameDetail: gameDetail, degree: $backDegree, rotation: $isFlipped, isLiked: $isLiked, isShowLottie: $isShowLottie, flipFunction: flipCard)
        }
    }
}

// #Preview {
//    GameDetailCardView(gameDetail: )
// }
