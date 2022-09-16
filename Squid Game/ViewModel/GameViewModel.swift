//
//  GameViewModel.swift
//  Squid Game
//
//  Created by Carlos Hernández on 15/09/22.
//

import Foundation

final class GameViewModel: ObservableObject {
    @Published var glassPanels: [GlassPanel] = []
    @Published var players: [Player]
    @Published var currentPlayer: Player?
    @Published var currentPanelIndex: Int = 0
    @Published var showWinnerModal: Bool = false
    @Published var showLoserModal: Bool = false
    @Published var winners: [Player] = []
    
    init(players: [Player]) {
        self.players = players
        self.generateGlassPanels(with: players.count)
        self.setFirstPlayer()
    }
    
    private func generateGlassPanels(with numberOfPlayers: Int) {
        for _ in 0..<numberOfPlayers * 3 {
            self.glassPanels.append(
                GlassPanel.allCases.randomElement()!
            )
        }
    }
    
    private func setFirstPlayer() {
        self.currentPlayer = players.first
    }
    
    func selectGlassPanel(with selection: GlassPanel) {
        if currentPlayer != nil {
            self.currentPlayer!.currentSelection = selection
        }
        
        self.validatePlayerSelection()
    }
    
    private func isValidSelection() -> Bool {
        self.currentPlayer?.currentSelection == glassPanels[currentPanelIndex]
    }
    
    private func validatePlayerSelection() {
        
        if !isValidSelection() {
            self.killCurrentPlayer()
        }
        
        if shouldContinueGame() {
            self.currentPanelIndex += 1
            self.goToNextPlayer()
        }
    }
    
    private func killCurrentPlayer() {
        let currentPlayerIndex = self.players.lastIndex(
            where: { $0.id == self.currentPlayer?.id }
        )
        
        guard let currentPlayerIndex = currentPlayerIndex else {
            return
        }
        
        self.players[currentPlayerIndex].isAlive = false
        self.currentPlayer = nil
    }
    
    private func shouldContinueGame() -> Bool {
        
        if !players.allSatisfy({ $0.isAlive }) {
            self.showLoserModal = true
            return false
        }
        
        if currentPanelIndex == glassPanels.count {
            self.winners = players.filter { $0.isAlive }
            self.showWinnerModal = true
            return false
        }
        
        return true
    }
    
    func goToNextPlayer() {
        self.currentPlayer = players.first(where: { $0.isAlive })
    }
}
