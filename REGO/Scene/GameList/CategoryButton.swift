//
//  CategoryButton.swift
//  REGO
//
//  Created by kokojong on 2/18/24.
//

import SwiftUI

struct CategoryButton: View {
    @Binding var selectedCategory: String
    var title: String
    var selectedColor: Color
    var deSelectedColor: Color

    var body: some View {
        Button(action: {
//            if selectedCategory != title {
                selectedCategory = title
//            }
        }, label: {
          Body3Text(title)
                .foregroundStyle(.white)
        })
        .padding(.horizontal, 14)
        .padding(.vertical, 6)
        .background(
//            selectedCategory == title ? selectedColor : deSelectedColor
            selectedColor // TODO: 미선택시 자동으로 선택되도록
        )
        .cornerRadius(10)
    }
}
