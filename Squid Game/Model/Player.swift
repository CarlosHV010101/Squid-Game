//
//  Player.swift
//  Squid Game
//
//  Created by Carlos Hernández on 15/09/22.
//

import Foundation

class Player {
    
    let id: UUID = UUID()
    let name: String
    var isDead: Bool = false
    var currentSelection: GlassPanel?
    
    init(name: String) {
        self.name = name
    }
}
