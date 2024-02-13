//
//  CarouselView.swift
//  REGO
//
//  Created by kokojong on 1/29/24.
//

import SwiftUI

struct Carousel<Content: View>: View {
    typealias PageIndex = Int

    let pageCount: Int
    let visibleEdgeSpace: CGFloat
    let spacing: CGFloat
    let content: (PageIndex) -> Content

    var gameDetails: [FetchDetailGamesModel]

    @GestureState var dragOffset: CGFloat = 0
    @Binding var currentIndex: Int

    init(
        gameDetails: [FetchDetailGamesModel],
        pageCount: Int,
        visibleEdgeSpace: CGFloat,
        spacing: CGFloat,
        currentIndex: Binding<Int>,
        @ViewBuilder content: @escaping (PageIndex) -> Content
    ) {
        self.gameDetails = gameDetails
        self.pageCount = pageCount
        self.visibleEdgeSpace = visibleEdgeSpace
        self.spacing = spacing
        self.content = content
        self._currentIndex = currentIndex
    }

    var body: some View {
        GeometryReader { proxy in
            let baseOffset: CGFloat = spacing + visibleEdgeSpace
            let pageWidth: CGFloat = proxy.size.width - (visibleEdgeSpace + spacing) * 2
            let offsetX: CGFloat = baseOffset + CGFloat(currentIndex) * -pageWidth + CGFloat(currentIndex) * -spacing + dragOffset

            HStack(spacing: spacing) {
                ForEach(0..<pageCount, id: \.self) { pageIndex in
                    self.content(pageIndex)
                        .frame(
                            width: pageWidth,
                            height: pageIndex == currentIndex ? proxy.size.height : 400
                        )
                }
                .contentShape(Rectangle())
            }
            .offset(x: offsetX)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, out, _ in
                        out = value.translation.width
                    }
                    .onEnded { value in
                        let offsetX = value.translation.width
                        let progress = -offsetX / pageWidth
                        let increment = Int(progress.rounded())

                        withAnimation(.linear) {
                            currentIndex = max(min(currentIndex + increment, pageCount - 1), 0)
                        }
                    }
            )
        }
    }
}
