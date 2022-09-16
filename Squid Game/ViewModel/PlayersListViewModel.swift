//
//  PlayersListViewModel.swift
//  Squid Game
//
//  Created by Carlos Hernández on 15/09/22.
//

import Foundation

final class PlayersListViewModel: ObservableObject {
    
    @Published var players: [Player]
    @Published var goToGame: Bool = false
    
    init(players: [Player]) {
        self.players = players
        self.shufflePlayers()
    }
    
    func shufflePlayers() {
        self.players.shuffle()
    }
}
