//
//  SplashExample01.swift
//  SplashCardTest
//
//  Created by Jean-Marc Boullianne on 4/25/20.
//  Copyright © 2020 TrailingClosure. All rights reserved.
//

import SwiftUI

struct SplashExample01: View {
    var colors: [Color] = [.blue, .red, .green, .orange]
    var backgroundColors: [Color] = [.green, .orange, .blue, .red]
    @State var index: Int = 0
    
    var body: some View {
        ZStack {
            SplashView(animationType: .angle(Angle(degrees: 30)), color: self.backgroundColors[self.index])
            VStack {
                GeometryReader { outsideProxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .center, spacing: 40) {
                            GeometryReader { insideProxy in
                                Color.clear
                                    .preference(key: ScrollOffsetPreferenceKey.self, value: [self.calculateContentOffset(fromOutsideProxy: outsideProxy, insideProxy: insideProxy)])
                                    // Send value to the parent
                            }
                            ForEach(self.colors, id: \.self) { color in
                                Rectangle()
                                    .frame(width: 250, height: 175, alignment: .center)
                                    .foregroundColor(color)
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)
                            }
                        }
                    .padding()
                    }
                }.onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    
                    let newIndex = Int((value[0] + 125) / (270))
                    if self.index != newIndex { self.index = newIndex }
                }
                SplashView(animationType: .circle, color: self.colors[self.index])
                    .frame(width: 300, height: 400, alignment: .center)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
                    .padding(.bottom, 50)
            }
        }
        .edgesIgnoringSafeArea(.vertical)
        
        
    }
    
    private func calculateContentOffset(fromOutsideProxy outsideProxy: GeometryProxy, insideProxy: GeometryProxy) -> CGFloat {
        return outsideProxy.frame(in: .global).minX - insideProxy.frame(in: .global).minX
    }
}

struct SplashExample01_Previews: PreviewProvider {
    static var previews: some View {
        SplashExample01()
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    typealias Value = [CGFloat]
    
    static var defaultValue: [CGFloat] = [0]
    
    static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
        value.append(contentsOf: nextValue())
    }
}
