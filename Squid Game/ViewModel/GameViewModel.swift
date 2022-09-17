//
//  GameViewModel.swift
//  Squid Game
//
//  Created by Carlos Hernández on 15/09/22.
//

import Foundation
import SwiftUI

final class GameViewModel: ObservableObject {
    ///Arreglo con los paneles de vidrio  del puente
    @Published var glassPanels: [GlassPanel] = []
    
    ///Arreglo de los jugadores ya revueltos
    @Published var players: [Player]
    
    ///Jugador actual en la partida
    @Published var currentPlayer: Player?
    
    ///Índice actual del arreglo de panels de vidrio
    @Published var currentPanelIndex: Int = 0
    
    ///Bandera para mostrar el modal de ganadores
    @Published var showWinnerView: Bool = false
    
    ///Bandera para mostrar el modal de perdedores
    @Published var showLoserView: Bool = false
    
    ///Arreglo para almacenar la lista de ganadores del juego
    @Published var winners: [Player] = []
    
    ///Bandera para mostrar la lista de jugadores en la vista
    @Published var showPlayerList: Bool = false
    
    ///Bandera para mostrar los botones de seleccionar panel
    @Published var showGlassPanelOptions: Bool = true
    
    ///Bandera para mostrar la alerta del siguiente jugador
    @Published var showNextPlayerAlert: Bool = false
    
    ///Inicializador que recibe el arreglo de jugadores, también manda a llamar a la función de asginar primer jugador y la función de generar paneles.
    init(players: [Player]) {
        self.players = players
        self.setFirstPlayer()
        self.generateGlassPanels(with: players.count)
    }
    
    ///Genera los paneles de vidrio de forma aleatoria para que al final el número de paneles sea igual al número de jugadores multiplicado por 2
    ///Parámetros: numberOfPlayers es un entero que representa el número de jugadores participando en la partida actual
    private func generateGlassPanels(with numberOfPlayers: Int) {
        for _ in 0..<numberOfPlayers * 2 {
            self.glassPanels.append(
                GlassPanel.allCases.randomElement()!
            )
        }
        for index in 0..<glassPanels.count {
            debugPrint("\(index). \(glassPanels[index])")
        }
    }
    
    ///Asigna el jugador actual toamando el primer elemento del arreglo de elementos
    private func setFirstPlayer() {
        self.currentPlayer = players.first
    }
    
    ///Asigna la selección obtenida de la ejecución del botón al jugador actual, posteriormente llama a la función que valida la selección del jugador
    func selectGlassPanel(with selection: GlassPanel) {
        if currentPlayer != nil {
            self.currentPlayer!.currentSelection = selection
        }
        self.validatePlayerSelection()
    }
    
    ///Comparación de la selección del jugador actual con el elemento del arreglo de paneles de vidrio en el índice actual de la partida
    private func isValidSelection() -> Bool {
        return self.currentPlayer?.currentSelection == glassPanels[currentPanelIndex]
    }
    
    ///Valida la selección del jugador, primero evalúa si la elección es correcta llamando a la función de validación de elección, si la elección no es válida manda a matar al jugador, manda a la función que asigna al siguiente jugador y activa la bandera para mostrar la alerta del siguiente jugador particpante. También manda a llamar a la función que evalúa si el juego debe de continuar, si el juego debe de continuar aumenta 1 al índice del arreglo de paneles de vidrio
    private func validatePlayerSelection() {
        if !isValidSelection() {
            self.killCurrentPlayer()
            self.goToNextPlayer()
            self.showNextPlayerAlert = true
        }
        
        if shouldContinueGame() {
            DispatchQueue.main.async {
                withAnimation {
                    self.currentPanelIndex += 1
                }
            }
        }
    }
    
    ///Cambia el atributo isDead a verdadero, primero busca el índice del jugador actual buscando por medio de su índice para posteriormente cambiar el valor de isDead y asignar el valor del jugador actual a nulo
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
    
    ///Valida si el juego debe de continuar, primero verifica si todos los jugadores han muerto, si es el caso muestra el modal de perdedores, esconde los botones para seleccionar panel y retorna falso. Después valida si el índice actual de paneles ha llegado hasta el número total de paneles, si es el caso almacena en el arreglo de ganadores aquellos jugadores que no murieron, muestra el modal de jugadores y esconde los botones de los panel, esconde los botones para seleccionar panel y retorna falso. Si aún hay jugadores vivos y aún no se ha llegado al último palen retorna verdadero.
    private func shouldContinueGame() -> Bool {
        
        if players.allSatisfy({ $0.isDead }) {
            self.showLoserView = true
            self.showGlassPanelOptions = false
            return false
        }
        
        if currentPanelIndex == glassPanels.count - 1 {
            self.winners = players.filter { !$0.isDead }
            self.showWinnerView = true
            self.showGlassPanelOptions = false
            winners.forEach { winner in
                debugPrint("Winner", winner.name)
            }
            return false
        }
        
        return true
    }
    
    ///Asigna al jugador actual el primero jugador que encuentre vivo en el arreglo
    func goToNextPlayer() {
        self.currentPlayer = players.first(
            where: { !$0.isDead }
        )
    }
}
