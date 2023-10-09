//
//  ColoredLabelView.swift
//  ColorAppSwiftUIEdition
//
//  Created by Акира on 09.10.2023.
//

import SwiftUI

struct ColoredView: View {
    
    @Binding var redLabelColor: Double
    @Binding var greenLabelColor: Double
    @Binding var blueLabelColor: Double
    
    var body: some View {
        
        Rectangle()
            .frame(width: 350, height: 200)
            .foregroundColor(Color(
                red: redLabelColor / 255,
                green: greenLabelColor / 255,
                blue: blueLabelColor / 255))
        
    }
}

struct ColoredLabelView_Previews: PreviewProvider {
    static var previews: some View {
        ColoredView(redLabelColor: .constant(100.0), greenLabelColor: .constant(25.0), blueLabelColor: .constant(0.0))
    }
}
