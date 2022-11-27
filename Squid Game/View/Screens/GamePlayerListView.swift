//
//  GamePlayerListView.swift
//  Squid Game
//
//  Created by Carlos Hernández on 17/09/22.
//

import SwiftUI

struct GamePlayerListView: View {
    
    @Binding private var players: [Player]
    @Binding private var showList: Bool
    
    init(players: Binding<[Player]>, showList: Binding<Bool>) {
        self._players = players
        self._showList = showList
    }
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                
                Text("Cerrar")
                    .onTapGesture {
                        withAnimation {
                            self.showList = false
                        }
                    }
            }
            
            Text("Jugadores")
                .font(.title)
            
            ScrollView(showsIndicators: false) {
                ForEach(players, id: \.id) { player in
                    HStack {
                        PlayerRowView(
                            name: player.name,
                            isDead: player.isDead,
                            image: player.image
                        )
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
        }        
        .background(Color.black)
    }
}

struct GamePlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        GamePlayerListView(
            players: .constant([Player(name: "Carlos", image: UIImage())]),
            showList: .constant(false)
        )
    }
}
