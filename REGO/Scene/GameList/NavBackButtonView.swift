//
//  NavBackButtonView.swift
//  REGO
//
//  Created by kokojong on 2/13/24.
//

import SwiftUI

struct NavBackButtonView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {  // <-- 👀 커스텀 버튼
        Button{
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(.icon24ArrowLeft) // 화살표 Image
                    .foregroundStyle(Color.white)
            }
        }
    }

}

#Preview {
    NavBackButtonView()
}
