//
//  GameListView.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import SwiftUI

struct GameListView: View {
    @State private var fetchGames: FetchGamesModel = Mock

    var body: some View {
        VStack(alignment: .leading) {
            H1Text("스피드 게임")
                .frame(height: 59)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    Section {
                        LazyVStack(alignment: .leading, content: {
                            ForEach(fetchGames.popularGames) { gameInfo in
                                GameRowView(gameInfo: gameInfo)
                            }
                        })
                    } header: {
                        HStack(spacing: 4) {
                            H4Text("인기 TOP")
                            H4Text("5")
                                .foregroundStyle(Color.primary500)
                        }
                    }
                    ForEach(fetchGames.allGames, id: \.category) { allGame in
                        Section {
                            ForEach(allGame.info) { gameInfo in
                                GameRowView(gameInfo: gameInfo)
                            }
                        } header: {
                            if let category =  allGame.category {
                                H4Text("\(category)")
                            }
                            else {
                                Subtitle1Text("이런 게임은 어때요?")
                            }
                        }
                    }
                }
            }
        }.padding(20)
    }
}

#Preview {
    GameListView()
}
