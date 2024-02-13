//
//  GameDetailCardView.swift
//  REGO
//
//  Created by kokojong on 1/29/24.
//

import SwiftUI

struct CardFront: View {
    @Binding var degree: Double
    @Binding var isLiked: Bool
    @Binding var isShowLottie: Bool

    var gameDetail: FetchDetailGamesModel

    var flipFunction: () -> Void

    var tagList: [TagEnum] = [.두뇌회전, .속도가생명, .신체사용, .팀대항전]

    init(gameDetail: FetchDetailGamesModel, degree: Binding<Double>, isLiked: Binding<Bool>, isShowLottie: Binding<Bool>, flipFunction: @escaping () -> Void) {
        self._degree = degree
        self._isLiked = isLiked
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
                    Body1Text(gameDetail.gameDescription)
                        .foregroundStyle(.white)

                    // TODO: nested scrollView 해결
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(tagList, id: \.self) { tag in
                                GameDetailTagView(tag: tag)
                            }
                        }
                    }
                    .background(Color.pink)
                }
                Spacer(minLength: 20)
                Subtitle3Text("게임방법")

                // 게임 설명 View
                VStack(alignment: .leading) {
                    HStack {
                        Image(.icon24User01)
                        Subtitle5Text("진행자")
                            .foregroundStyle(.white)
                    }
                    Body4Text("참여자들이 헷갈리도록 물건의 위치를 바꿔주세요.")
                    Divider()
                        .foregroundStyle(Color.gray600)
                    HStack {
                        Image(.icon24User02)
                        Subtitle5Text("참여자")
                            .foregroundStyle(.white)
                    }
                    Body4Text("5분간 원본을 관찰하고 바뀐 모습을 빠르게 찾아야 해요.")
                    Spacer()
                }
                .padding(14)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.white)
                        .opacity(0.1)
                )

                HStack(spacing: 8) {
                    Body2Text("Tip!")
                    Body5Text("잘못된 정답을 외쳐도 괜찮아요!")
                }
                Button(action: {
                    self.flipFunction()
                }, label: {
                    Text("예시보기")
                        .frame(maxWidth: .infinity, maxHeight: 46)
                        .clipShape(.rect(cornerRadius: 12))
                        .foregroundStyle(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.black)
                        )
                })
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 24)
            if isShowLottie {
                LottieView(filename: "like_big_lottie", loopMode: .playOnce)
                    .frame(width: 120, height: 120)
            }
        }
//        .overlay(
//            RoundedRectangle(cornerRadius: 24)
//                .stroke(Color.purple50, lineWidth: 1)
//        )
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardBack: View {
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
                    Text("설명보기")
                        .frame(maxWidth: .infinity, maxHeight: 46)
                        .clipShape(.rect(cornerRadius: 12))
                        .foregroundStyle(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.black))
                })
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 24)
            .rotation3DEffect(
                .degrees(rotation ? 0 : 180),
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

struct GameDetailCardView: View {
    // MARK: Variables
    @State private var backDegree = -90.0
    @State private var frontDegree = 0.0
    @State private var isFlipped = false
    @State private var isLiked: Bool
    @State private var isShowLottie: Bool = true

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
                frontDegree = 90
            }
            withAnimation(
                .easeInOut(duration: durationAndDelay).delay(durationAndDelay)){
                    backDegree = 0
                }
        }
        else {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }

            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 180
            }

            frontDegree = 0
            backDegree = -90
        }
    }

    var body: some View {
        ZStack {
            CardFront(gameDetail: gameDetail, degree: $frontDegree, isLiked: $isLiked, isShowLottie: $isShowLottie, flipFunction: flipCard)
            CardBack(gameDetail: gameDetail, degree: $backDegree, rotation: $isFlipped, isLiked: $isLiked, isShowLottie: $isShowLottie, flipFunction: flipCard)
        }
    }
}

// #Preview {
//    GameDetailCardView(gameDetail: )
// }
