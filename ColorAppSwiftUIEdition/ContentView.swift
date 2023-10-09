//
//  ContentView.swift
//  ColorAppSwiftUIEdition
//
//  Created by Акира on 09.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State var redValue = Double.random(in: 1...255)
    @State var greenValue = Double.random(in: 1...255)
    @State var blueValue = Double.random(in: 1...255)
    var body: some View {
        VStack {
            
            ColoredView(redLabelColor: $redValue,
                        greenLabelColor: $greenValue,
                        blueLabelColor: $blueValue)
            
            VStack {
                SliderView(value: $redValue, chooseColor: .red)
                SliderView(value: $greenValue, chooseColor: .green)
                SliderView(value: $blueValue, chooseColor: .blue)
                
                Spacer()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
