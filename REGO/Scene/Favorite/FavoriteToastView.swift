//
//  FavoriteToastView.swift
//  REGO
//
//  Created by 최모지 on 2/23/24.
//

import SwiftUI
import ComposableArchitecture

struct FavoriteToastView: View {
    @State var didAdd: Bool

    init(didAdd: Bool) {
        self.didAdd = didAdd
    }

    var body: some View {
        ZStack {
            Color.gray800
            addToastView().opacity(didAdd ? 1 : 0)
            deleteToastView().opacity(didAdd ? 0 : 1)
        }
        .cornerRadius(5)
        .frame(height: 50)
    }
}

extension FavoriteToastView {
    @ViewBuilder
    func addToastView() -> some View {
        HStack {
            Spacer().frame(width: 14)
            Image(.icon24Liked).foregroundColor(.primary500)
            Spacer().frame(width: 4)
            Body1Text("관심 게임에 추가했어요!")
            Spacer()
            NavigationLink {
                FavoriteView(store: Store(
                    initialState: FavoriteViewFeature.State(),
                    reducer: {
                        FavoriteViewFeature()
                    })
                )
            } label: {
                HStack(spacing: 2){
                    Body5Text("관심 게임").foregroundColor(Color.gray100)
                    Image(.icon24ArrowRight)
                        .resizable().frame(width: 16, height: 16)
                        .foregroundColor(Color.gray200)
                }
            }
            .buttonStyle(.plain)
            Spacer().frame(width: 14)
        }
    }

    @ViewBuilder
    func deleteToastView() -> some View {
        HStack {
            Spacer().frame(width: 14)
            Body1Text("관심 게임에서 삭제했어요.")
            Spacer()
        }
    }
}

#Preview {
    FavoriteToastView(didAdd: true)
}
