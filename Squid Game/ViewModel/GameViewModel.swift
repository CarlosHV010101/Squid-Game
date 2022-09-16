//
//  GameViewModel.swift
//  Squid Game
//
//  Created by Carlos Hernández on 15/09/22.
//

import Foundation
import SwiftUI

final class GameViewModel: ObservableObject {
    @Published var glassPanels: [GlassPanel] = []
    @Published var players: [Player]
    @Published var currentPlayer: Player?
    @Published var currentPanelIndex: Int = 0
    @Published var showWinnerModal: Bool = false
    @Published var showLoserModal: Bool = false
    @Published var winners: [Player] = []
    @Published var showPlayerList: Bool = false
    @Published var showGlassPanelOptions: Bool = true
    
    init(players: [Player]) {
        self.players = players
        self.setFirstPlayer()
        self.generateGlassPanels(with: players.count)
    }
    
    private func generateGlassPanels(with numberOfPlayers: Int) {
        for _ in 0..<numberOfPlayers * 2 {
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
        return self.currentPlayer?.currentSelection == glassPanels[currentPanelIndex]
    }
    
    private func validatePlayerSelection() {
        if !isValidSelection() {
            self.killCurrentPlayer()
            self.goToNextPlayer()
        }
        
        if shouldContinueGame() {
            DispatchQueue.main.async {
                withAnimation {
                    self.currentPanelIndex += 1
                    self.goToNextPlayer()
                }
            }
        }
    }
    
    private func killCurrentPlayer() {
        let currentPlayerIndex = self.players.lastIndex(
            where: { $0.id == self.currentPlayer?.id }
        )
        
        guard let currentPlayerIndex = currentPlayerIndex else {
            return
        }
        
        self.players[currentPlayerIndex].isDead = true
        self.currentPlayer = nil
    }
    
    private func shouldContinueGame() -> Bool {
        
        if players.allSatisfy({ $0.isDead }) {
            self.showLoserModal = true
            self.showGlassPanelOptions = false
            return false
        }
        
        if currentPanelIndex == glassPanels.count - 1 {
            self.winners = players.filter { !$0.isDead }
            self.showWinnerModal = true
            self.showGlassPanelOptions = false
            winners.forEach { winner in
                debugPrint("Winner", winner.name)
            }
            return false
        }
        
        return true
    }
    
    func goToNextPlayer() {
        self.currentPlayer = players.first(
            where: { !$0.isDead }
        )
    }
}
