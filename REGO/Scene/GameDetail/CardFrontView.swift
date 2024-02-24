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

    var gameDetail: GameDetail

    var flipFunction: () -> Void

    var tagList: [Tag]

    init(gameDetail: GameDetail, degree: Binding<Double>, isLiked: Binding<Bool>, isShowLottie: Binding<Bool>, flipFunction: @escaping () -> Void) {
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
                            .lineLimit(2)
                        Spacer()
                        Button {
                            isLiked.toggle()
                            if isLiked {
                                isShowLottie = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    isShowLottie = false
                                }
                                Task {
                                    try await NetworkManager.shared.request(api: .likeGame(id: gameDetail.gameUuid))
                                }
                            }
                            else {
                                isShowLottie = false
                                Task {
                                    try await NetworkManager.shared.request(api: .unlikeGame(id: gameDetail.gameUuid))
                                }
                            }
                        } label: {
                            GameDetailLikeButton(isLiked: $isLiked, isShowLottie: $isShowLottie)
                        }
                    }
                    Body1Text(gameDetail.gameDescription)
                        .foregroundStyle(.white)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(tagList, id: \.self) { tag in
                                GameDetailTagView(tag: tag)
                                    .frame(height: 24)
                            }
                        }
                    }
                }
                Spacer(minLength: 20)
                Subtitle3Text("게임방법")

                // 게임 설명 View
                VStack(alignment: .leading) {
                    if let mc = gameDetail.gameHow.mc {
                        HStack {
                            Image(.icon24User01)
                                .resizable()
                                .frame(width: 16, height: 16)
                            Subtitle5Text("진행자")
                                .foregroundStyle(.white)
                        }
                        Body4Text(mc)
                            .foregroundStyle(Color.gray100)
                        Divider()
                            .foregroundStyle(Color.gray700)
                    }
                    HStack {
                        Image(.icon24User02)
                            .resizable()
                            .frame(width: 16, height: 16)
                        Subtitle5Text("참여자")
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    Body4Text(gameDetail.gameHow.attendee)
                        .foregroundStyle(Color.gray100)
                    Spacer()
                }
                .padding(14)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.white)
                        .opacity(0.1)
                )
                if let tip = gameDetail.tip {
                    Spacer(minLength: 10)
                    HStack(spacing: 8) {
                        Body2Text("Tip!")
                        Body5Text(tip)
                            .foregroundStyle(Color.gray200)
                    }
                }
                if gameDetail.uiType == .TEXT_EXAMPLE || gameDetail.uiType == .IMAGE_EXAMPLE {
                    Spacer(minLength: 20)
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
