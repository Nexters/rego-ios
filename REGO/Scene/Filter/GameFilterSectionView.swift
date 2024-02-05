//
//  GameFilterSectionView.swift
//  REGO
//
//  Created by 최모지 on 2/5/24.
//

import SwiftUI

struct GameFilterSectionView: View {
    @State private var filterTitle: String
    @State private var filterList: [String]

    init(title: String, list: [String]) {
        self.filterTitle = title
        self.filterList = list
    }

    var body: some View {
        VStack {
            HStack {
                Spacer().frame(width: 20)
                Subtitle3Text("인원 수")
                Spacer()
            }
            Spacer().frame(height: 14)
            HStack(spacing: 14) {
                Spacer().frame(width: 6)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: { // TODO: 버튼 컴포넌트화
                    Body1Text("test1")
                })
                .padding(.horizontal, 14).padding(.vertical, 8)
                .background(Color.primary500)
                .cornerRadius(10)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Body1Text("test2")
                })
                .padding(.horizontal, 14).padding(.vertical, 8)
                .background(Color.gray700)
                .cornerRadius(10)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Body1Text("test3")
                })
                .padding(.horizontal, 14).padding(.vertical, 8)
                .background(Color.gray700)
                .cornerRadius(10)
                Spacer()
            }
        }
    }
}

#Preview {
    GameFilterSectionView(title: "test", list: []) // TODO: 데이터 바인딩
}
