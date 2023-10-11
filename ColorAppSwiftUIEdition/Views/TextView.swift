//
//  TextView.swift
//  ColorAppSwiftUIEdition
//
//  Created by Акира on 11.10.2023.
//

import SwiftUI

struct TextView: View {
    
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    @State var showAlert = false
    
    
    var colorHEX: String {
        let red = Int(red * 255)
        let green = Int(green * 255)
        let blue = Int(blue * 255)
        
        return String(format: "#%02X%02X%02X", red, green, blue)
    }
    
    
    var body: some View {
        Text(colorHEX)
            .onTapGesture() {
                UIPasteboard.general.string = colorHEX
                showAlert.toggle()
            }
            .animation(Animation.easeInOut(duration: 0.1), value: colorHEX)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Умница"), message: Text("Скопировано"))
            }
    }
    
    struct TextView_Previews: PreviewProvider {
        static var previews: some View {
            TextView(red: .constant(15.0),
                     green: .constant(70.0),
                     blue: .constant(1004.0))
        }
    }
    
    
}
