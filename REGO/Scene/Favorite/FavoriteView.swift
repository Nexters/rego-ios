//
//  FavoriteView.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        ZStack {
            Color.gray900
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Spacer().frame(width: 20)
                    H1Text("관심 게임")
                    Spacer().frame(width: 6)
                    H3Text("10").foregroundColor(.gray200)
                    Spacer()
                }
                // TODO: 리스트뷰 처리 + 데이터 바인딩
                VStack(spacing: 20) {
                    FavoriteItemView()
                    FavoriteItemView()
                    FavoriteItemView()
                    FavoriteItemView()
                    FavoriteItemView()
                    FavoriteItemView()
                    FavoriteItemView()
                    FavoriteItemView()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    FavoriteView()
}
