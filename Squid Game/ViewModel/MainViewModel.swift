//
//  MainViewModel.swift
//  Squid Game
//
//  Created by Carlos Hernández on 15/09/22.
//

import Foundation
import UIKit

final class MainViewModel: ObservableObject {
    
    ///Arreglo inicial con los jugadores que son registrados
    @Published var players: [Player] = []
    
    ///Texto que utiliza el TextField para los jugadores
    @Published var playerName: String = ""
    
    ///Imagen del usuario
    @Published var playerImage: UIImage?
    
    ///Bandera que muestra el error en caso de existir
    @Published var showError: Bool = false
    
    ///Texto del error
    @Published var error: String = ""
    
    ///Bandera para mostrar la lista de jugadores
    @Published var goToPlayersList: Bool = false
    
    ///Bandera para mostrar una alerta
    @Published var presentAlert: Bool = false
    
    ///Bandera para mostrar el ImagePicker
    @Published var showSheet: Bool = false
    
    ///Crea y añade un jugador al arreglo de jugadores
    func addPlayer() {
        self.resetErrors()
        if playerName.isEmpty {
            self.showError = true
            self.error = "El nombre del jugar no puede estar vacío"
            return
        }
        
        guard let playerImage = playerImage else {
            self.showError = true
            self.error = "Tome una foto del jugador"
            return
        }
        
        
        self.players.append(
            Player(
                name: playerName,
                image: playerImage
            )
        )
        self.playerName = ""
        self.playerImage = nil
    }
    
    ///Evalúa si por lo menos hay 2 jugadores y pasa a la siguiente pantalla
    func registerPlayers() {
        self.resetErrors()
        if players.count < 2 {
            self.showError = true
            self.error = "Debe de haber por lo menos 2 jugadores"
            return
        }
        
        self.goToPlayersList = true
    }
    
    ///Reinicia los errores de la pantalla
    private func resetErrors() {
        self.showError = false
        self.error = ""
    }
    
    ///Deja vacio el arreglo de jugadores
    func resetPlayers() {
        self.players.removeAll()
    }
}
