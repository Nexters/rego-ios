//
//  REGOApp.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import SwiftUI

@main
struct REGOApp: App {
    @State private var showHomeView = false

    var body: some Scene {
        WindowGroup {
            ZStack {
                if showHomeView {
                    HomeView()
                }
                else {
                    SplashView()
                        .onAppear(perform: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                showHomeView = true
                            }
                        })
                }
            }
        }
    }
}
