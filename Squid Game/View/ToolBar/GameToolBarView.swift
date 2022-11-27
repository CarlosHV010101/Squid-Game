//
//  GameToolBarView.swift
//  Squid Game
//
//  Created by Carlos Hernández on 16/09/22.
//

import SwiftUI

struct GameToolBarView: View {
    
    private let leftIconAction: () -> Void
    private let rightIconAction: () -> Void
    
    init(leftIconAction: @escaping () -> Void,
         rightIconAction: @escaping () -> Void) {
        self.leftIconAction = leftIconAction
        self.rightIconAction = rightIconAction
    }
    
    var body: some View {
        HStack {
            
            Button(action: {
                leftIconAction()
            }) {
                Text("Mostrar jugadores")
            }
            
            Spacer()
            
            Button(action: {
                rightIconAction()
            }) {
                Text("Terminar partida")
            }
        }
    }
}

struct GameToolBarView_Previews: PreviewProvider {
    static var previews: some View {
        GameToolBarView(leftIconAction: {}, rightIconAction: {})
    }
}
