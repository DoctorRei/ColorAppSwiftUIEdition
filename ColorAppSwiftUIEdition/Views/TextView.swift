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
    @State var isCopied = false {
        didSet {
            if isCopied == true {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isCopied = false
                    }
                }
            }
        }
    }
    
    var colorHEX: String {
        let red = Int(red * 255)
        let green = Int(green * 255)
        let blue = Int(blue * 255)
        
        return String(format: "#%02X%02X%02X", red, green, blue)
    }
    
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                if isCopied {
                    Text("Copied to clipboard")
                        .padding()
                        .background(Color.blue.cornerRadius(20))
                        .position(x: geo.frame(in: .local).width/2)
                        .transition(.move(edge: .top))
                        .padding(.top)
                        .animation(Animation.easeInOut(duration: 1), value: isCopied)
                }
                
                VStack {
                    Text(colorHEX)
                        .onTapGesture() {
                            UIPasteboard.general.string = colorHEX
                            withAnimation {
                                isCopied = true
                            }
                        }
                }
                
                
                
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(red: .constant(15.0),
                 green: .constant(70.0),
                 blue: .constant(1004.0))
    }
}


