//
//  PlayersListViewModel.swift
//  Squid Game
//
//  Created by Carlos Hernández on 15/09/22.
//

import Foundation

final class PlayersListViewModel: ObservableObject {
    
    ///Arreglo con los jugadores registrados
    @Published var players: [Player]
    
    ///Bandera para ir a la pantalla de juego
    @Published var goToGame: Bool = false
    
    init(players: [Player]) {
        self.players = players
        self.shufflePlayers()
    }
    
    ///Revuelve todos los jugadores de forma aleatoria
    func shufflePlayers() {
        self.players.shuffle()
    }
}
