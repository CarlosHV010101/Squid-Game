//
//  MainViewModel.swift
//  Squid Game
//
//  Created by Carlos Hernández on 15/09/22.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    @Published var players: [Player] = []
    @Published var playerName: String = ""
    @Published var showError: Bool = false
    @Published var error: String = ""
    @Published var goToPlayersList: Bool = false
    
    func addPlayer() {
        self.resetErrors()
        if playerName.isEmpty {
            self.showError = true
            self.error = "El nombre del jugar no puede estar vacío"
            return
        }
        
        self.players.append(Player(name: playerName))
        self.playerName = ""
        
    }
    
    func startGame() {
        self.resetErrors()
        if players.count < 2 {
            self.showError = true
            self.error = "Debe de haber por lo menos 2 jugadores"
            return
        }
        
        self.goToPlayersList = true
    }
    
    private func resetErrors() {
        self.showError = false
        self.error = ""
    }
}
