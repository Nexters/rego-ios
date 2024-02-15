//
//  NavToolbarModifier.swift
//  REGO
//
//  Created by kokojong on 2/16/24.
//

import SwiftUI

struct NavToolbarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    NavBackButtonView()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavLikeButtonView(likeCnt: 5) // TODO: API 연결
                }
            })
    }
}
