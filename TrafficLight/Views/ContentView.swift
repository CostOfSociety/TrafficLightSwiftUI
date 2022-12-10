//
//  ContentView.swift
//  TrafficLight
//
//  Created by Святослав on 10.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentLight = CurrentLight.red
    private let lightIsOn = 1.0
    private let lightIsOff = 0.3
    
    @State private var redLight: LightView
    @State private var yellowLight: LightView
    @State private var greenLight: LightView
    
    init() {
        redLight = LightView(color: .red, opacity: lightIsOff)
        yellowLight = LightView(color: .yellow, opacity: lightIsOff)
        greenLight = LightView(color: .green, opacity: lightIsOff)
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack() {
                VStackLayout(spacing: 20) {
                    redLight
                    yellowLight
                    greenLight
                }
                Spacer()
                Button(action: tappedButton) {
                    Text("Next")
                        .font(.title)
                        .fontWeight(.bold)
                        .tint(.white)
                }.padding(EdgeInsets(top: 16,leading: 50,bottom: 16, trailing: 50))
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
            }.padding(.bottom, 20)
        }
    }
}
// MARK: Enums
extension ContentView {
    private enum CurrentLight {
        case red, yellow, green
    }
}

// MARK: Private Methods
extension ContentView {
    private func tappedButton() {
        switch currentLight {
        case .red:
            greenLight.opacity = lightIsOff
            redLight.opacity = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLight.opacity = lightIsOff
            yellowLight.opacity = lightIsOn
            currentLight = .green
        case .green:
            yellowLight.opacity = lightIsOff
            greenLight.opacity = lightIsOn
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
