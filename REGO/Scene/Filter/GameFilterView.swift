//
//  GameFilterView.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import SwiftUI

struct GameFilterView: View {
    var body: some View {
        ZStack {
            Color.gray800
            VStack(alignment: .center) {
                Spacer().frame(height: 24)
                HStack(alignment: .center) {
                    Spacer().frame(width: 20)
                    H1Text("상세필터")
                    Spacer()
                    Button(action: {}, label: {
                        Image(.icon24Close)
                            .renderingMode(.template)
                            .foregroundColor(.gray100)
                    })
                    Spacer().frame(width: 20)
                }
                HStack {
                    Spacer().frame(width: 20)
                    Body4Text("중복 선택 가능해요.")
                    Spacer()
                }
                Spacer().frame(height: 24)
                VStack(spacing: 20) {
                    // TODO: 데이터 바인딩
                    GameFilterSectionView(title: "", list: [])
                    GameFilterSectionView(title: "", list: [])
                    GameFilterSectionView(title: "", list: [])
                    GameFilterSectionView(title: "", list: [])
                    GameFilterSectionView(title: "", list: [])
                }
                Spacer()
                HStack(spacing: 14) {
                    Spacer().frame(width: 6)
                    Button(action: {}, label: {
                        Image(.icon24Refresh)
                            .renderingMode(.template)
                            .foregroundColor(.gray100)
                        Subtitle4Text("초기화")
                    })
                    .padding(.horizontal, 14).padding(.vertical, 12)
                    .background(Color(uiColor: .gray700))
                    .cornerRadius(14)
                    Button(action: {}, label: {
                        Subtitle4Text("적용하기")
                    })
                    .padding(.horizontal, 14)
                    .frame(height: 48).frame(maxWidth: .infinity)
                    .background(Color.primary500)
                    .cornerRadius(14)
                    Spacer().frame(width: 6)
                }
                Spacer().frame(height: 14)
            }
        }
    }
}

#Preview {
    GameFilterView()
}
