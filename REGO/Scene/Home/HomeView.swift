//
//  HomeView.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    @State private var path: [NextView] = []

    enum NextView: Hashable {
        /// 특정 카테고리 게임 리스트
        case gameListView(homeCategory: HomeCategoryEnum)
        /// 전체 게임 리스트
        case allGameList
        /// 관심 게임 리스트
        case favoriteView
    }

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                LinearGradient(colors: [.homeGradientTop, .homeGradientBottom],
                               startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center) {
                    HStack {
                        Spacer()
                            .frame(width: 20)
                        Button(action: {}, label: {
                            LottieView(filename: "logo_lottie")
                                .frame(width: 77, height: 28)
                        })
                        Spacer()
                        Button(action: {}, label: {
                            Body6Text("게임 제안하기")
                                .foregroundColor(Color.white)
                        })
                        .frame(width: 86, height: 30)
                        .background(Color.gray700)
                        .cornerRadius(6)
                        Spacer()
                            .frame(width: 12)
                        Button(action: {
                            path.append(.favoriteView)
                        }, label: {
                            Image(uiImage: .icon24Liked)
                                .renderingMode(.template)
                                .foregroundColor(.gray100)
                        })
                        .frame(width: 30, height: 30)
                        .background(Color.gray700)
                        .cornerRadius(6)
                        Spacer()
                            .frame(width: 20)
                    }
                    .frame(height: 52)
                    ScrollView(showsIndicators: false) {
                        Spacer().frame(height: 40)
                        VStack {
                            H1Text("다 함께 친해져야 하는\n이 순간 RE'GO!")
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                                .lineSpacing(6)
                                .frame(height: 78).frame(maxWidth: .infinity)
                        }
                        ZStack {
                            Button(action: {
                                path.append(.gameListView(homeCategory: .SPEED))
                            }, label: {
                                Image(uiImage: .mainSpeed)
                            })
                            .rotationEffect(.degrees(-10))
                            .offset(x: -100)
                            Button(action: {
                                path.append(.gameListView(homeCategory: .MC))
                            }, label: {
                                Image(uiImage: .mainMc)
                            })
                            .rotationEffect(.degrees(10))
                            .offset(x: 100, y: 20)
                            Button(action: {
                                path.append(.gameListView(homeCategory: .THEME))
                            }, label: {
                                Image(uiImage: .mainTheme)
                            })
                            .rotationEffect(.degrees(-10))
                            .offset(x: -80, y: 170)
                            Button(action: {
                                path.append(.gameListView(homeCategory: .ENTERTAINMENT))
                            }, label: {
                                Image(uiImage: .mainGame)
                            })
                            .rotationEffect(.degrees(5))
                            .offset(x: 100, y: 200)
                            Button(action: {
                                path.append(.gameListView(homeCategory: .MATERIALS))
                            }, label: {
                                Image(uiImage: .mainOption)
                            })
                            .offset(x: -180, y: 300)
                            .rotationEffect(.degrees(-20))
                        }
                    }
                    Button(action: {
                        path.append(.allGameList)
                    }) {
                        HStack {
                            Image(.icon24Menu)
                                .renderingMode(.template)
                                .foregroundColor(.gray100)
                            Subtitle4Text("전체 게임 목록")
                                .foregroundColor(.gray100)
                        }
                    }
                    .frame(width: 144, height: 44)
                    .background(Color.gray600)
                    .cornerRadius(12)
                }
            }
            .navigationDestination(for: NextView.self) { next in
                switch next {
                case .gameListView(let homeCategory):
                    GameListView(homeCategory: homeCategory)
                case .allGameList:
                    GameListView(homeCategory: .FILTER, 
                                 filterTags: [.TWO_FIVE, .FIVE_TEN, .NO_LIMIT, .SPEED, .TWENTY])
                case .favoriteView:
                    FavoriteView(store: Store(
                        initialState: FavoriteViewFeature.State(),
                        reducer: {
                            FavoriteViewFeature()
                        })
                    )
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
