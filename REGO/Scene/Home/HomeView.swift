//
//  HomeView.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import SwiftUI

struct HomeView: View {
    @State private var isPresentSheet: Bool = false

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(uiColor: .homeGradientTop), Color(uiColor: .homeGradientBottom)],
                           startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Button(action: {
                        print("[tapped] logo")
                    }, label: {
                        Image(.logo) // TODO: Lottie 적용
                    })
                    Spacer()
                    Button(action: {
                        print("[tapped] 게임 제안하기")
                    }, label: {
                        Text("게임 제안하기")
                            .font(RegoFontStyle.body6.font)
                            .foregroundColor(Color(uiColor: .gray100))
                    })
                    .frame(width: 86, height: 30)
                    .background(Color(uiColor: .gray700))
                    .cornerRadius(6)
                    Spacer()
                        .frame(width: 12)
                    Button(action: {
                        print("[tapped] 좋아요 목록")
                    }, label: {
                        Image(uiImage: .icon24Liked)
                            .renderingMode(.template)
                            .foregroundColor(Color(uiColor: .gray100))
                    })
                    .frame(width: 30, height: 30)
                    .background(Color(uiColor: .gray700))
                    .cornerRadius(6)
                    Spacer()
                        .frame(width: 20)
                }
                .frame(height: 52)
                Spacer()
                    .frame(height: 50)
                Text("다 함께 친해져야 하는\n이 순간 RE'GO!")
                    .font(RegoFontStyle.h1.font)
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .lineSpacing(6)
                    .frame(height: 78)
                Spacer()
                Button(action: {
                    print("[tapped] 전체 게임 목록")
                }) {
                    HStack {
                        Image(.icon24Menu)
                            .renderingMode(.template)
                            .foregroundColor(Color(uiColor: .gray100))
                        Text("전체 게임 목록")
                            .font(RegoFontStyle.subtitle4.font)
                            .foregroundColor(Color(uiColor: .gray100))
                    }
                }
                .frame(width: 144, height: 44)
                .background(Color(uiColor: .gray600))
                .cornerRadius(12)

            }
        }
    }
}

#Preview {
    HomeView()
}
