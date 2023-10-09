//
//  TextView.swift
//  ColorAppSwiftUIEdition
//
//  Created by Акира on 09.10.2023.
//

import SwiftUI

struct TextView: View {
    
    @Binding var rgbText: String
    
    var body: some View {
        TextField(rgbText, text: $rgbText)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(rgbText: .constant("Hello there"))
    }
}
