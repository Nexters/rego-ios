//
//  SplashView.swift
//  REGO
//
//  Created by 최모지 on 2/4/24.
//

import SwiftUI
import Lottie

struct SplashView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.homeGradientTop, .homeGradientBottom],
                           startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                LottieView(filename: "logo_lottie")
                    .frame(width: 165, height: 60)
            }
        }
    }
}

#Preview {
    SplashView()
}
