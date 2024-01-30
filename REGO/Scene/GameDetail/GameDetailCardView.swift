//
//  GameDetailCardView.swift
//  REGO
//
//  Created by kokojong on 1/29/24.
//

import SwiftUI

struct CardFront: View {
    @Binding var degree: Double

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

            }

        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardBack: View {
    @Binding var degree: Double

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue.opacity(0.7), lineWidth: 3)

            RoundedRectangle(cornerRadius: 20)
                .fill(.blue.opacity(0.2))
                .shadow(color: .gray, radius: 2, x: 0, y: 0)

            Text("뒷 면")

        }
        .background(.pink)
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))

    }
}

struct GameDetailCardView: View {
    // MARK: Variables
    //    @State var backDegree = 0.0
    //    @State var frontDegree = -90.0
    @State var backDegree = -90.0
    @State var frontDegree = 0.0
    @State var isFlipped = false

    let durationAndDelay: CGFloat = 0.5

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
            CardFront(degree: $frontDegree)
            CardBack(degree: $backDegree)
        }.onTapGesture {
            flipCard()
        }
    }
}

#Preview {
    GameDetailCardView()
}
