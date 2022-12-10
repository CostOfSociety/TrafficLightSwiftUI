//
//  CirlceView.swift
//  TrafficLight
//
//  Created by Святослав on 10.12.2022.
//

import SwiftUI

struct LightView: View {
    let color: Color
    var opacity: Double
    
    init(color: Color , opacity: Double = 1.0) {
        self.color = color
        self.opacity = opacity
    }
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: UIScreen.main.bounds.width * 0.4)
            .overlay(Circle().stroke(Color.white, lineWidth: 4.0))
            .opacity(opacity)
    }
}

struct LightView_Previews: PreviewProvider {
    static var previews: some View {
        LightView(color: .red)
    }
}
