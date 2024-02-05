//
//  FavoriteItemView.swift
//  REGO
//
//  Created by 최모지 on 2/6/24.
//

import SwiftUI

struct FavoriteItemView: View {
    var body: some View {
        HStack(alignment: .center) {
            Spacer().frame(width: 20)
            Image(uiImage: ._3DSpeed)
                .resizable()
                .frame(width: 36, height: 36)
                .background(Color.gray700)
                .cornerRadius(8)
            Spacer().frame(width: 10)
            Button(action: {}, label: {
                ButtonText("노래 맞추기")
            })
            Spacer()
            Button(action: {}, label: {
                Image(.icon24Liked)
                    .renderingMode(.template)
                    .foregroundColor(.primary500)
            })
            .frame(width: 24, height: 24)
            Spacer().frame(width: 20)
        }
    }
}

#Preview {
    FavoriteItemView()
}
