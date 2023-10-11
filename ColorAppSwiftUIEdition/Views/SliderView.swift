//
//  LabelView.swift
//  ColorAppSwiftUIEdition
//
//  Created by Акира on 09.10.2023.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var value: Double
    
    let chooseColor: Color
    
    var body: some View {
        HStack {
            Text("0").bold()
                .padding()
            Slider(value: $value, in: 0...255, step: 1)
                .tint(chooseColor)
            Text("255").bold()
                .padding()
        }
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(155.0), chooseColor: .red)
    }
}
