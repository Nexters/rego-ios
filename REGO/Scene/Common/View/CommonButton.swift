//
//  CommonButton.swift
//  REGO
//
//  Created by kokojong on 2/18/24.
//

import SwiftUI

struct CommonButton: View {
    @State var isSelected: Bool
    var title: String
    var selectedColor: Color
    var deSelectedColor: Color

    var body: some View {
        Button(action: {
            isSelected.toggle()
        }, label: {
          Body3Text(title)
                .foregroundStyle(.white)
        })
        .padding(.horizontal, 14)
        .padding(.vertical, 6)
        .background(
            isSelected ? selectedColor : deSelectedColor
        )
        .cornerRadius(10)
    }
}

#Preview {
    CommonButton(isSelected: false, title: "테스트", selectedColor: .primary500, deSelectedColor: .gray800)
}
