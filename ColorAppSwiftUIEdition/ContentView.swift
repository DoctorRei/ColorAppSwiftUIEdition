//
//  ContentView.swift
//  ColorAppSwiftUIEdition
//
//  Created by Акира on 09.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var redValue = Double.random(in: 0...255)
    @State var greenValue = Double.random(in: 0...255)
    @State var blueValue = Double.random(in: 0...255)
    
    
    var body: some View {
        
        VStack {
            
            HStack {
                TextView(red: $redValue, green: $greenValue, blue: $blueValue)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Image(systemName:"arrow.right.doc.on.clipboard")
            }
            
            VStack(alignment: .center) {
                
                TextFieldView(rgbText: $redValue, rgbColor: .red)
                
                SliderView(value: $redValue, chooseColor: .red)
                
                TextFieldView(rgbText: $greenValue, rgbColor: .green)
                
                SliderView(value: $greenValue, chooseColor: .green)
                
                TextFieldView(rgbText: $blueValue, rgbColor: .blue)
                
                SliderView(value: $blueValue, chooseColor: .blue)
                
                ColoredView(redLabelColor: $redValue,
                            greenLabelColor: $greenValue,
                            blueLabelColor: $blueValue)
                .cornerRadius(15)
                .padding()
                
            }
        }
        .keyboardType(.numberPad)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
