//
//  TransactionLineGraph.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-24.
//

import SwiftUI

struct TransactionLineGraph: View {
    
    
    var data : [CGFloat]
    @State var currentPlot = ""
    @State var offset : CGSize = .zero
    @State var showPlot = false
    @State var translation : CGFloat = 0
    
    var body: some View {
        GeometryReader { proxy in
            let height = proxy.size.height
            let width = (proxy.size.width) / CGFloat(data.count - 1)
            
            let maxPoint = (data.max() ?? 0) + 100
            
            let points = data.enumerated().compactMap { item -> CGPoint in
                let progress = item.element / maxPoint
                let pathHeight = progress * height
                
                let pathWidth = width * CGFloat(item.offset)
                
                return CGPoint(x: pathWidth, y: -pathHeight + height)
            }
            
            ZStack {
                // MARK: "Path"
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    
                    path.addLines(points)
                }
                .strokedPath(StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                .fill(
                    LinearGradient(colors: [cynGreen, cynGreen2], startPoint: .leading, endPoint: .trailing)
                )
                
                FillBG()
                    .clipShape(
                        Path { path in
                            path.move(to: CGPoint(x: 0, y: 0))
                            path.addLines(points)
                            path.addLine(to: CGPoint(x: proxy.size.width, y: height))
                            path.addLine(to: CGPoint(x: 0, y: height))
                        })
                //                .padding(.top, 15)
            }
            .overlay(
                // MARK: drag indicator
                VStack(spacing: 0) {
                    Text(currentPlot)
                        .font(.caption.bold())
                        .foregroundColor(cynWhite)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(cynGreen2, in: Capsule())
                        .offset(x: translation < 10 ? 30 : 0)
                        .offset(x: translation > (proxy.size.width - 60) ? -30 : 0)
                    
                    Rectangle()
                        .fill(cynGreen2)
                        .frame(width: 1, height: 40)
                        .padding(.top)
                    
                    Circle()
                        .fill(cynGreen2)
                        .frame(width: 22, height: 22)
                        .overlay(
                            Circle()
                                .fill(cynWhite)
                                .frame(width: 10, height: 10)
                        )
                    
                    Rectangle()
                        .fill(cynGreen2)
                        .frame(width: 1, height: 55)
                }
                    .frame(width: 80, height: 170)
                    .offset(y: 70)
                    .offset(offset),
//                    .opacity(showPlot ? 1 : 0)
                
                alignment: .bottomLeading
            )
            .contentShape(Rectangle())
            .gesture(DragGesture().onChanged({ value in
                
                withAnimation { showPlot = true }
                
                let translation = value.location.x - 40
                
                let index = max(min(Int((translation / width).rounded() + 1), data.count - 1), 0)
                
                currentPlot = "$ \(data[index])"
                self.translation = translation
                
                offset = CGSize(width: points[index].x - 40, height: points[index].y - height)
                
            }).onEnded({ value in
                withAnimation { showPlot = false }
            }))
        }
        .overlay(
            VStack(alignment: .leading) {
                
                let max = data.max() ?? 0
                
                Text("S \(Int(max))")
                    .font(.caption.bold())
                
                Spacer()
                
                Text("$ 0")
                    .font(.caption.bold())
            }
                .frame(maxWidth: .infinity, alignment: .leading)
        )
        .padding(.horizontal, 10)
    }
    
    @ViewBuilder
    func FillBG() -> some View {
        LinearGradient(colors: [
            cynGreen2.opacity(0.3),
            cynGreen2.opacity(0.2),
            cynGreen2.opacity(0.1),
        ] + Array(repeating: cynGreen.opacity(0.1), count: 4) + Array(repeating: Color.clear, count: 2), startPoint: .top, endPoint: .bottom)
    }
}

