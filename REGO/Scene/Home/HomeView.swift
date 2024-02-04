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
            LinearGradient(colors: [.homeGradientTop, .homeGradientBottom],
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
                            .font(.body6)
                            .foregroundColor(.gray100)
                    })
                    .frame(width: 86, height: 30)
                    .background(Color.gray700)
                    .cornerRadius(6)
                    Spacer()
                        .frame(width: 12)
                    Button(action: {
                        print("[tapped] 좋아요 목록")
                    }, label: {
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
                Spacer()
                    .frame(height: 50)
                Text("다 함께 친해져야 하는\n이 순간 RE'GO!")
                    .font(.h1)
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
                            .foregroundColor(.gray100)
                        Text("전체 게임 목록")
                            .font(.subtitle4)
                            .foregroundColor(Color.gray100)
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
