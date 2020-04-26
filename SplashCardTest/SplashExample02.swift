//
//  SplashExample02.swift
//  SplashCardTest
//
//  Created by Jean-Marc Boullianne on 4/25/20.
//  Copyright © 2020 TrailingClosure. All rights reserved.
//

import SwiftUI

struct SplashExample02: View {
    var colors: [Color] = [.blue, .red, .green, .orange]
    var backgroundColors: [Color] = [.green, .orange, .blue, .red]
    @State var index: Int = 0
    
    var body: some View {
        ZStack {
            SplashView(animationType: .angle(Angle(degrees: 30)), color: self.backgroundColors[self.index])
            VStack {
                
                
                
                
                SplashView(animationType: .circle, color: self.colors[self.index])
                    .frame(width: 300, height: 375, alignment: .center)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
                
                Button(action: {
                    self.index = (self.index + 1) % self.colors.count
                }) {
                    Text("Change Colors")
                        .font(Font.system(size: 18, weight: .bold, design: .default))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color(red: 51/255, green: 51/255, blue: 51/255))
                        .cornerRadius(5)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
                    
                }.padding(.top, 50)
                    
            }
        }
        .edgesIgnoringSafeArea(.vertical)
        
        
    }
}

struct SplashExample02_Previews: PreviewProvider {
    static var previews: some View {
        SplashExample02()
    }
}
