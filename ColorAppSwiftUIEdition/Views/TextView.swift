//
//  TextView.swift
//  ColorAppSwiftUIEdition
//
//  Created by Акира on 09.10.2023.
//

import SwiftUI

struct TextView: View {
    
    @Binding var rgbText: Double
    @Binding var SliderColorName: String
    @Binding var rgbColor: Color
    
    var body: some View {
        TextField(SliderColorName, text: Binding<String>(
            get: { String(format: "%.0f", rgbText) },
            set: { if let value = Double($0) { rgbText = value } }
        ))
        .bordered(rgbColor: $rgbColor)
    }
}

struct BorderedCustomModify: ViewModifier {
    
    @Binding var rgbColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .overlay(RoundedRectangle(cornerRadius: 4)
                .stroke(lineWidth: 2)
                .foregroundColor(rgbColor))
            
            .shadow(color: rgbColor, radius: 3, x: 1, y: 2)
            .multilineTextAlignment(.center)
            .bold()
            .foregroundColor(rgbColor)
    }
}

extension TextField {
    func bordered(rgbColor: Binding<Color>) -> some View {
        modifier(BorderedCustomModify(rgbColor: rgbColor))
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(rgbText: .constant(102.0),
                 SliderColorName: .constant("Red"),
                 rgbColor: .constant(.red))
    }
}
