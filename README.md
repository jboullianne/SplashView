# SplashView
### Color Changing Animations using SwiftUI

 ![Stars](https://img.shields.io/github/stars/jboullianne/SplashView?style=social)  ![Followers](https://img.shields.io/github/followers/jboullianne?style=social)  ![Forks](https://img.shields.io/github/forks/jboullianne/SplashView?style=social)

Written for [TrailingClosure.com](https://trailingclosure.com/swiftui-animating-color-changes/).

> Time to spice up your color changes! SplashView uses `Path`s and `AnimatableData` to animate color changes on SwiftUI Views!


![Example](images/SplashView_Example.gif?v=4&s=200)

## Usage

```swift

// The SplashView's take in a SplashAnimation enum to decide which animation they perform on color change.
SplashView(animationType: .angle(Angle(degrees: 45)), color: self.colors[self.index])

SplashView(animationType: .angle(Angle(degrees: 135)), color: self.colors[self.index])

SplashView(animationType: .angle(Angle(degrees: 315)), color: self.colors[self.index])

SplashView(animationType: .angle(Angle(degrees: 225)), color: self.colors[self.index])

SplashView(animationType: .topToBottom, color: self.colors[self.index])

SplashView(animationType: .circle, color: self.colors[self.index])

// Change the `index` counter on user interaction to see the View's change color.

```
