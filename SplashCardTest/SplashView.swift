//
//  SplashCard.swift
//  SplashCardTest
//
//  Created by Jean-Marc Boullianne on 4/24/20.
//  Copyright © 2020 TrailingClosure. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    
    
    var animationType: SplashShape.SplashAnimation
    
    
    @State private var prevColor: Color
    @ObservedObject var colorStore: ColorStore
    
    @State var layers: [(Color,CGFloat)] = []

    
    init(animationType: SplashShape.SplashAnimation, color: Color) {
        self.animationType = animationType
        self._prevColor = State<Color>(initialValue: color)
        self.colorStore = ColorStore(color: color)
    }
    
    var body: some View {
        Rectangle()
            .foregroundColor(self.prevColor)
            .overlay(
                ZStack {
                    ForEach(layers.indices, id: \.self) { x in
                        SplashShape(progress: self.layers[x].1, animationType: self.animationType)
                            .foregroundColor(self.layers[x].0)
                    }
                    
                }
                
                , alignment: .leading)
            .onReceive(self.colorStore.$color) { color in
                self.layers.append((color, 0))
                
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.layers[self.layers.count-1].1 = 1.0
                    /*DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.prevColor = self.layers[0].0
                        self.layers.remove(at: 0)
                    }*/
                }
            }
    }
    
}

struct SplashCard_Previews: PreviewProvider {
    
    @State static var color: Color = Color.blue
    
    static var previews: some View {
        SplashView(animationType: .rightToLeft, color: color)
    }
}

class ColorStore: ObservableObject {
    @Published var color: Color
    
    init(color: Color) {
        self.color = color
    }
}
