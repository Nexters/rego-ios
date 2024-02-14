//
//  CardFrontView.swift
//  REGO
//
//  Created by kokojong on 2/14/24.
//

import SwiftUI

struct CardFrontView: View {
    @Binding var degree: Double
    @Binding var isLiked: Bool
    @Binding var isShowLottie: Bool

    var gameDetail: FetchDetailGamesModel

    var flipFunction: () -> Void

    var tagList: [TagEnum]

    init(gameDetail: FetchDetailGamesModel, degree: Binding<Double>, isLiked: Binding<Bool>, isShowLottie: Binding<Bool>, flipFunction: @escaping () -> Void) {
        self._degree = degree
        self._isLiked = isLiked
        self._isShowLottie = isShowLottie
        self.gameDetail = gameDetail
        self.flipFunction = flipFunction
        self.tagList = gameDetail.tag
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

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(tagList, id: \.self) { tag in
                                GameDetailTagView(tag: tag)
                            }
                        }
                    }
                }
                Spacer(minLength: 20)
                HStack {
                    Subtitle3Text("게임방법")
                    GameDetailLikeButton(isLiked: $isLiked, isShowLottie: $isShowLottie)
                }

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
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.purple50, lineWidth: 1)
        )
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}
