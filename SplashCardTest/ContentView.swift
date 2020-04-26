//
//  ContentView.swift
//  SplashCardTest
//
//  Created by Jean-Marc Boullianne on 4/24/20.
//  Copyright © 2020 TrailingClosure. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var colors: [Color] = [.blue, .red, .green, .orange]
    @State var index: Int = 0
    
    @State var progress: CGFloat = 0
    var body: some View {
        VStack {
            HStack {
                SplashView(animationType: .angle(Angle(degrees: 45)), color: self.colors[self.index])
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
                SplashView(animationType: .angle(Angle(degrees: 135)), color: self.colors[self.index])
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
            }
            HStack {
                SplashView(animationType: .angle(Angle(degrees: 315)), color: self.colors[self.index])
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
                SplashView(animationType: .angle(Angle(degrees: 225)), color: self.colors[self.index])
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
            }
            HStack {
                SplashView(animationType: .topToBottom, color: self.colors[self.index])
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
                SplashView(animationType: .circle, color: self.colors[self.index])
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
            }
            
            Button(action: {
                self.index = (self.index + 1) % self.colors.count
            }) {
                Text("Change Color")
            }
            .padding(.top, 200)
        }
        .padding(.all, 200)
        .background(Color(red: 38/255, green: 50/255, blue: 56/255))
  
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


