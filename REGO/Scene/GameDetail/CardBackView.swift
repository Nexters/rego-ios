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

    var gameDetail: GameDetail

    init(gameDetail: GameDetail, degree: Binding<Double>, rotation: Binding<Bool>, isLiked: Binding<Bool>, isShowLottie: Binding<Bool>, flipFunction: @escaping () -> Void) {
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
                    HStack { // TODO: Front, Back 2줄에 대한 대응 -> 너무 경우가 달라서 이상해짐
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
                }
                Spacer().frame(height: 20)
                Subtitle3Text("문제예시")
                switch gameDetail.uiType {
                case .IMAGE_EXAMPLE:
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: gameDetail.gameImageExample!.image))
                            .cornerRadius(12)
                        HStack(spacing: 10) {
                            Body2Text("정답예시")
                            Body5Text(gameDetail.gameImageExample?.answer ?? "")
                        }
                    }
                case .TEXT_EXAMPLE:
                    ScrollView(.vertical) {
                        if let games = gameDetail.gameExample {
                            LazyVStack(alignment: .leading, spacing: 8) {
                                ForEach(games, id: \.self) { game in
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.gray700)

                                        HStack {
                                            Body4Text(game)
                                                .foregroundStyle(.white)
                                            Spacer()
                                        }
                                        .padding(.horizontal, 14)
                                        .padding(.vertical, 7)
                                    }
                                }
                            }
                        }
                    }
                default:
                    EmptyView()
                }
                Spacer().frame(height: 20)
                Button(action: {
                    self.flipFunction()
                }, label: {
                    Subtitle4Text("설명보기")
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
