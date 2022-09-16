//
//  PrimaryButton.swift
//  Squid Game
//
//  Created by Carlos Hernández on 15/09/22.
//

import SwiftUI

struct PrimaryButton: View {
    
    private let text: String
    private let action: () -> Void
    
    init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(text)
                .foregroundColor(Color.black)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(
            text: "Añadir jugador",
            action: {}
        )
        .previewLayout(.sizeThatFits)
    }
}
