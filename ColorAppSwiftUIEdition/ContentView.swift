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
            .padding()
            
            VStack(alignment: .center) {
                
                TextField("Red", text: Binding<String>(
                    get: { String(format: "%.0f", redValue) },
                    set: { if let value = Double($0) { redValue = value } }
                ))
                
                SliderView(value: $redValue, chooseColor: .red)
                
                TextField("Green", text: Binding<String>(
                    get: { String(format: "%.0f", greenValue) },
                    set: { if let value = Double($0) { greenValue = value } }
                ))
                
                SliderView(value: $greenValue, chooseColor: .green)
                
                TextField("Blue", text: Binding<String>(
                    get: { String(format: "%.0f", blueValue) },
                    set: { if let value = Double($0) { blueValue = value } }
                ))
                
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
