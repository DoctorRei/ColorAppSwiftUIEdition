//
//  TextView.swift
//  ColorAppSwiftUIEdition
//
//  Created by Акира on 09.10.2023.
//

import SwiftUI

struct TextFieldView: View {
    
    @State var showAlert = false
    @Binding var rgbText: Double
    let rgbColor: Color
    
    var body: some View {
        TextField("", text: Binding<String>(
            get: { String(format: "%.0f", rgbText) },
            set: { newValue in
                if let value = Double(newValue), (0...255).contains(value) {
                    rgbText = value
                } else {
                    showAlert = true
                }
            }
        ))
        .bordered(rgbColor: rgbColor)
        
        .alert(isPresented: $showAlert,
               title: "Ой",
               message: "Для ввода доступны числа от 0 до 255")
        
        
        
    }
    
    
}

struct BorderedCustomModify: ViewModifier {
    
    let rgbColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .overlay(RoundedRectangle(cornerRadius: 4)
                .stroke(lineWidth: 2)
                .foregroundColor(rgbColor))
            .frame(width: 100 , height: 45)
        
        
            .multilineTextAlignment(.center)
            .bold()
        
    }
}

extension TextField {
    func bordered(rgbColor: Color) -> some View {
        modifier(BorderedCustomModify(rgbColor: rgbColor))
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(rgbText: .constant(202.0), rgbColor: .red)
    }
}
