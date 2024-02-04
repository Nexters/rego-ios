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
            Color(uiColor: .gray800)
            VStack(alignment: .center) {
                Spacer().frame(height: 24)
                HStack(alignment: .center) {
                    Spacer().frame(width: 20)
                    Text("상세필터")
                        .font(RegoFontStyle.h1.font)
                        .foregroundColor(Color(uiColor: .gray100))
                    Spacer()
                    Button(action: {
                        print("[tapped] close button")
                    }, label: {
                        Image(.icon24Close)
                            .renderingMode(.template)
                            .foregroundColor(Color(uiColor: .gray100))
                    })
                    Spacer().frame(width: 20)
                }
                HStack {
                    Spacer().frame(width: 20)
                    Text("중복 선택 가능해요.")
                        .font(RegoFontStyle.body4.font)
                        .foregroundColor(Color(uiColor: .gray100))
                    Spacer()
                }
                Spacer().frame(height: 24)
                VStack(spacing: 20) {
                    GameFilterSectionView(title: "", list: [])
                    GameFilterSectionView(title: "", list: [])
                    GameFilterSectionView(title: "", list: [])
                    GameFilterSectionView(title: "", list: [])
                    GameFilterSectionView(title: "", list: [])
                }
                Spacer()
                HStack(spacing: 14) {
                    Spacer().frame(width: 6)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(.icon24Refresh)
                            .renderingMode(.template)
                            .foregroundColor(Color(uiColor: .gray100))
                        Text("초기화")
                            .font(RegoFontStyle.subtitle4.font)
                            .foregroundColor(Color(uiColor: .gray100))
                    })
                    .padding(.horizontal, 14).padding(.vertical, 12)
                    .background(Color(uiColor: .gray700))
                    .cornerRadius(14)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("적용하기")
                            .font(RegoFontStyle.subtitle4.font)
                            .foregroundColor(Color(uiColor: .gray100))
                    })
                    .padding(.horizontal, 14)
                    .frame(height: 48).frame(maxWidth: .infinity)
                    .background(Color(uiColor: .primary500))
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
