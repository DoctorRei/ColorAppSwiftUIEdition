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
                
                TextFieldView(rgbText: $redValue, rgbColor: .red)
                
                SliderView(value: $redValue, chooseColor: .red)
                
                TextFieldView(rgbText: $greenValue, rgbColor: .green)
                
                SliderView(value: $greenValue, chooseColor: .green)
                
                TextFieldView(rgbText: $blueValue, rgbColor: .blue)
                
                SliderView(value: $blueValue, chooseColor: .blue)
                
                               
                TextView(red: $redValue, green: $greenValue, blue: $blueValue)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    
                
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
