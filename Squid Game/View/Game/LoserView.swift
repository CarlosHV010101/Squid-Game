//
//  LoserView.swift
//  Squid Game
//
//  Created by Carlos Hernández on 17/09/22.
//

import SwiftUI

struct LoserView: View {
    
    private let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        VStack {
            
            Text("¡Derrota!")
                .font(.title3)
            
            Text("Todos los jugadores han muerto")
                
            PrimaryButton(text: "Nueva partida", action: action)
        }
    }
}

struct LoserView_Previews: PreviewProvider {
    static var previews: some View {
        LoserView(action: {})
    }
}
