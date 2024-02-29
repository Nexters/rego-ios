//
//  NavToolbarModifier.swift
//  REGO
//
//  Created by kokojong on 2/16/24.
//

import SwiftUI

struct NavToolbarModifier: ViewModifier {
//    let likeCnt: Int
    @Binding var likeCnt: Int64

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    NavBackButtonView()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavLikeButtonView(likeCnt: $likeCnt) // TODO: API 연결
                }
            })
            .background(Color.gray900)
    }
}
