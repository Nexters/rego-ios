//
//  GameListTagView.swift
//  REGO
//
//  Created by 최모지 on 2/18/24.
//

import SwiftUI

struct GameListTagView: View {
    // 임시 데이터
    var tagList: [String] = ["속도가 생명", "진행자 필요", "속도가 생명", "진행자 필요", "속도가 생명", "진행자 필요", "속도가 생명", "진행자 필요"]
    
    var body: some View {
        VStack {
            HStack {
                Spacer().frame(width: 20)
                H1Text("게임 둘러보기")
                Spacer()
                Button(action: {
                    // TODO: FilterBottomSheet 연결
                }, label: {
                    Image(uiImage: .icon24Filter)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                })
                .frame(width: 34, height: 34)
                .background(Color.primary500)
                .cornerRadius(6)
                Spacer().frame(width: 20)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    Spacer().frame(width: 6)
                    ForEach(tagList, id: \.self) { tag in
                        filterTagView(title: tag)
                    }
                    Spacer().frame(width: 6)
                }
            }
        }
    }
}

extension GameListTagView {
    @ViewBuilder
    func filterTagView(title: String) -> some View {
        Button(action: {
            // TODO: 삭제 처리
        }, label: {
            Body3Text(title)
            Image(.icon24Close)
                .resizable()
                .frame(width: 14, height: 14)
                .foregroundColor(.white)
            
        })
        .padding(.horizontal, 14).padding(.vertical, 6)
        .background(Color.primary500)
        .cornerRadius(10)
    }
}

#Preview {
    GameListTagView()
}
