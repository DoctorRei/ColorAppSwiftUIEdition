//
//  AlertView.swift
//  ColorAppSwiftUIEdition
//
//  Created by Акира on 11.10.2023.
//

import SwiftUI

struct AlertView: ViewModifier {
    @Binding var showAlert: Bool
    let title: String
    let message: String
    
    func body(content: Content) -> some View {
        content.alert(isPresented: $showAlert) {
            Alert(title: Text(title),
                  message: Text(message),
                  dismissButton: .default(Text("OK")))
        }
    }
}

extension View {
    func alert(isPresented: Binding<Bool>, title: String, message: String) -> some View {
        self.modifier(AlertView(showAlert: isPresented, title: title, message: message))
    }
}
