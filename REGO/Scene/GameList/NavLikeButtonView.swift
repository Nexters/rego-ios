//
//  NavLikeButtonView.swift
//  REGO
//
//  Created by kokojong on 2/1/24.
//

import SwiftUI
import ComposableArchitecture

struct NavLikeButtonView: View {
    @State var likeCnt: Int

    init(likeCnt: Int) {
        self.likeCnt = likeCnt
    }

    var body: some View {
        NavigationLink {
            FavoriteView(store: Store(
                initialState: FavoriteViewFeature.State(),
                reducer: {
                    FavoriteViewFeature()
                })
            )
        } label: {
            ZStack(alignment: .topLeading) {
                Image(.icon24Liked)
                    .resizable()
                    .frame(width: 34, height: 34)
                    .foregroundStyle(likeCnt > 0 ? Color(.primary500) : Color(.gray200))

                if likeCnt > 0 {
                    Text(likeCnt < 999 ? "\(likeCnt)" : "+999")
                        .padding(3)
                        .frame(height: 13)
                        .font(RegoFontStyle.body7.font)
                        .foregroundStyle(Color(.primary500))
                        .background(.white)
                        .cornerRadius(99)
                        .padding(.leading, 21)
                }
            }
        }
    }
}

#Preview {
    NavLikeButtonView(likeCnt: 30)
}
