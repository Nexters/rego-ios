//
//  FavoriteEmptyView.swift
//  REGO
//
//  Created by 최모지 on 2/17/24.
//

import SwiftUI
import ComposableArchitecture

struct FavoriteEmptyView: View {
    var body: some View {
        ZStack {
            Color.gray900
            VStack {
                Spacer()
                Image(uiImage: ._3DEmpty)
                Spacer().frame(height: 12)
                Body1Text("찜한 게임이 아직 없어요!\n게임을 찜하면 여기에 나타나요.")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .lineSpacing(6)

                Spacer()
                HStack {
                    Spacer().frame(width: 20)
                    Button(action: {
                        // TODO: 홈화면 이동
                    }, label: {
                        Subtitle4Text("게임 둘러보기")
                    })
                    .padding(.vertical, 11)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray800)
                    .cornerRadius(10)
                    Spacer().frame(width: 20)
                }
                Spacer().frame(height: 28)
            }
        }

    }
}

#Preview {
    FavoriteEmptyView()
}
