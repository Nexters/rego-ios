//
//  FavoriteItemView.swift
//  REGO
//
//  Created by 최모지 on 2/6/24.
//

import SwiftUI
import ComposableArchitecture

struct FavoriteItemView: View {
    let store: StoreOf<FavoriteItemFeature>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            HStack(alignment: .center) {
                Spacer().frame(width: 20)
                Image(uiImage: ._3DSpeed)
//                 store.game.iconType.image // TODO: 컴파일 오류 수정
                    .resizable()
                    .frame(width: 36, height: 36)
                    .background(Color.gray700)
                    .cornerRadius(8)
                Spacer().frame(width: 10)
                Button(action: {}, label: {
                    ButtonText(viewStore.game.title)
                        .foregroundColor(Color.white)
                })
                Spacer()
                Button(action: {
                    viewStore.send(.sendSelectItem)
                }, label: {
                    Image(.icon24Liked)
                        .renderingMode(.template)
                        .foregroundColor(viewStore.state.isSelected ? .primary500 : .gray400)
                })
                .frame(width: 24, height: 24)
                Spacer().frame(width: 20)
            }
        }
    }
}

#Preview {
    FavoriteItemView(store: Store(
        initialState: FavoriteItemFeature.State(id: UUID(), game: LikeGame(heartID: 1, gameUuid: 1, iconType: .ACTIVE, title: "액티브브")),
        reducer: {
            FavoriteItemFeature()
        }))
}
