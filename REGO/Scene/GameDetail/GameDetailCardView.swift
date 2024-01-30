//
//  GameDetailCardView.swift
//  REGO
//
//  Created by kokojong on 1/29/24.
//

import SwiftUI

struct CardFront: View {
    @Binding var degree: Double

    var flipFunction: () -> Void

    var tagList: [String] = ["준비물", "진행자"]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(.orange)

            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "star")
                    Text("음식 확대 사진 맞추기")
                    Button(action: {

                    }, label: {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.red)
                    })

                }
                Text("확대된 사진을 보고 음식을 맞추는 게임")
                HStack {
                    ForEach(tagList, id: \.self) { tag in
                        HStack {
                            Image(systemName: "star")
                            Text("\(tag)")

                        }
                        .foregroundColor(.blue)
                        .background(
                            RoundedRectangle(cornerRadius: 6))
                    }
                }
                Text("게임 방법")
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "star")
                        Text("진행자")
                    }
                    Text("참여자들이 헷갈리도록 물건의 위치를 바꿔주세요.")
                    Divider()
                    HStack {
                        Image(systemName: "star")
                        Text("참여자")
                    }
                    Text("5분간 원본을 관찰하고 바뀐 모습을 빠르게 찾아야 해요.")
                    Spacer()
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.gray)
                        .opacity(0.5)
                )
                .padding()
                Text("Tip! 잘못된 정답을 외쳐도 괜찮아요")
                    .padding()
                Button(action: {
                    self.flipFunction()
                }, label: {
                    Text("예시보기")
                        .frame(maxWidth: .infinity, maxHeight: 46)
                        .clipShape(.rect(cornerRadius: 12))
                        .foregroundStyle(.white)
                        .background(Color.black)
                })
            }
            .padding()
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardBack: View {
    @Binding var degree: Double
    @Binding var rotation: Bool

    var flipFunction: () -> Void

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue.opacity(0.7), lineWidth: 3)

            RoundedRectangle(cornerRadius: 20)
                .fill(.blue.opacity(0.2))
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            VStack {
                Text("문제 예시")
                Image(systemName: "person")
                Spacer()
                Button(action: {
                    self.flipFunction()
                }, label: {
                    Text("설명보기")
                        .frame(maxWidth: .infinity, maxHeight: 46)
                        .clipShape(.rect(cornerRadius: 12))
                        .foregroundStyle(.white)
                        .background(Color.black)

                })
            }
            .background(.yellow)
            .padding()
            .rotation3DEffect(
                .degrees(rotation ? 0 : 180),
                                      axis: (x: 0.0, y: 1.0, z: 0.0)
            )
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))

    }
}

struct GameDetailCardView: View {
    // MARK: Variables
    @State var backDegree = -90.0
    @State var frontDegree = 0.0
    @State var isFlipped = false

    let durationAndDelay: CGFloat = 1

    // MARK: Flip Card Function
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
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
    // MARK: View Body
    var body: some View {
        ZStack {
            CardFront(degree: $frontDegree, flipFunction: flipCard)
            CardBack(degree: $backDegree, rotation: $isFlipped, flipFunction: flipCard)
        }
    }
}

#Preview {
    GameDetailCardView()
}
