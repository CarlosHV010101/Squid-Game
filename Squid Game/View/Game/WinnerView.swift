//
//  WinnerView.swift
//  Squid Game
//
//  Created by Carlos Hernández on 17/09/22.
//

import SwiftUI

struct WinnerView: View {
    
    @Binding private var players: [Player]
    private let action: () -> Void
    
    init(players: Binding<[Player]>, action: @escaping () -> Void) {
        self._players = players
        self.action = action
    }
    
    var body: some View {
        VStack(spacing: 15) {
            
            Text("¡Victoria!")
                .font(.title3)
            
            Text("Jugadores ganadores:")
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(players, id: \.id) { player in
                        PlayerView(name: player.name,
                                   image: player.image
                        )
                    }
                }
            }
                
            PrimaryButton(text: "Nueva partida", action: action)
        }
    }
}

struct WinnerView_Previews: PreviewProvider {
    static var previews: some View {
        WinnerView(players: .constant([]), action: {})
    }
}
