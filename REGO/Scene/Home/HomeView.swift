//
//  HomeView.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.homeGradientTop, .homeGradientBottom],
                           startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Button(action: {}, label: {
                        Image(.logo) // TODO: Lottie 적용
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Body6Text("게임 제안하기")
                    })
                    .frame(width: 86, height: 30)
                    .background(Color.gray700)
                    .cornerRadius(6)
                    Spacer()
                        .frame(width: 12)
                    Button(action: {}, label: {
                        Image(uiImage: .icon24Liked)
                            .renderingMode(.template)
                            .foregroundColor(.gray100)
                    })
                    .frame(width: 30, height: 30)
                    .background(Color.gray700)
                    .cornerRadius(6)
                    Spacer()
                        .frame(width: 20)
                }
                .frame(height: 52)
                ScrollView(showsIndicators: false) {
                    Spacer().frame(height: 40)
                    VStack {
                        H1Text("다 함께 친해져야 하는\n이 순간 RE'GO!")
                            .lineLimit(nil)
                            .multilineTextAlignment(.center)
                            .lineSpacing(6)
                            .frame(height: 78).frame(maxWidth: .infinity)
                    }
                    ZStack {
                        // TODO: 게임 종류 Enum 처리 + 각도 세밀 조정
                        Button(action: {}, label: {
                            Image(uiImage: .mainSpeed)
                        })
                        .rotationEffect(.degrees(-10))
                        .offset(x: -100)
                        Button(action: {}, label: {
                            Image(uiImage: .mainMc)
                        })
                        .rotationEffect(.degrees(10))
                        .offset(x: 100, y: 20)
                        Button(action: {}, label: {
                            Image(uiImage: .mainTheme)
                        })
                        .rotationEffect(.degrees(-10))
                        .offset(x: -80, y: 170)
                        Button(action: {}, label: {
                            Image(uiImage: .mainGame)
                        })
                        .rotationEffect(.degrees(5))
                        .offset(x: 100, y: 200)
                        Button(action: {}, label: {
                            Image(uiImage: .mainOption)
                        })
                        .offset(x: -180, y: 300)
                        .rotationEffect(.degrees(-20))
                    }
                }
                Button(action: {}) {
                    HStack {
                        Image(.icon24Menu)
                            .renderingMode(.template)
                            .foregroundColor(.gray100)
                        Subtitle4Text("전체 게임 목록")
                    }
                }
                .frame(width: 144, height: 44)
                .background(Color.gray600)
                .cornerRadius(12)
            }
        }
    }
}

#Preview {
    HomeView()
}
