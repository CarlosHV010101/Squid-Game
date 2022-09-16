//
//  CustomTextField.swift
//  Squid Game
//
//  Created by mac on 15/09/22.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding private var text: String
    private let placeholder: String
    private let onCommit: () -> Void
    
    init(text: Binding<String>,
         placeholder: String,
         onCommit: @escaping () -> Void
    ) {
        self._text = text
        self.placeholder = placeholder
        self.onCommit = onCommit
    }
    
    var body: some View {
        TextField(placeholder, text: $text) {
            onCommit()
        }
        .foregroundColor(Color.black)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(
            text: .constant(""),
            placeholder: "Ingrese algo aquí",
            onCommit: {}
        )
        .previewLayout(.sizeThatFits)
    }
}
