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

    var flipFunction: () -> Void

    var tagList: [TagEnum] = [.두뇌회전, .속도가생명, .신체사용, .팀대항전]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(.linearGradient(.init(colors: [.homeGradientTop, .homeGradientBottom]), startPoint: .top, endPoint: .bottom))

            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(._3DSpeed)
                            .resizable()
                            .frame(width: 36, height: 36)
                        H3Text("음식 확대 사진 맞추기")
                            .foregroundStyle(.white)
                        Spacer()
                        GameDetailLikeButton(isLiked: $isLiked)
                    }
                    Body1Text("확대된 사진을 보고 음식을 맞추는 게임")
                        .foregroundStyle(.white)

                    // TODO: nested scrollView 해결
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(tagList, id: \.self) { tag in
                                GameDetailTagView(tag: tag)
                            }
                        }
                    }
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
        }
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.purple50, lineWidth: 1)
        )
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardBack: View {
    @Binding var degree: Double
    @Binding var rotation: Bool
    @Binding var isLiked: Bool

    var flipFunction: () -> Void

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(.linearGradient(.init(colors: [.homeGradientTop, .homeGradientBottom]), startPoint: .top, endPoint: .bottom))

            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(._3DSpeed)
                            .resizable()
                            .frame(width: 36, height: 36)
                        H3Text("음식 확대 사진 맞추기")
                            .foregroundStyle(.white)
                        Spacer()
                        GameDetailLikeButton(isLiked: $isLiked)
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
    @State var isLiked = false

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
            CardFront(degree: $frontDegree, isLiked: $isLiked, flipFunction: flipCard)
            CardBack(degree: $backDegree, rotation: $isFlipped, isLiked: $isLiked, flipFunction: flipCard)
        }
    }
}

#Preview {
    GameDetailCardView()
}
