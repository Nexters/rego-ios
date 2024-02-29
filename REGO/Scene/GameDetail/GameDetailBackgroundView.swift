//
//  GameDetailBackgroundView.swift
//  REGO
//
//  Created by 최모지 on 2/23/24.
//

import SwiftUI

struct GameDetailBackgroundView: View {
    var body: some View {
        ZStack {
            Image(.bgCircle)
                .resizable()
                .frame(width: 240, height: 240)
                .position(x: -20, y: 120)
            Image(.bgClover)
                .resizable()
                .frame(width: 240, height: 240)
                .rotationEffect(.degrees(15))
            Image(.bgHexa)
                .resizable()
                .frame(width: 240, height: 240)
                .position(x: Utils.deviceWidth + 40, y: 520)
                .rotationEffect(.degrees(15))
        }
        .background(Color.gray900)
    }
}

#Preview {
    GameDetailBackgroundView()
}
