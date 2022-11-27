//
//  Player.swift
//  Squid Game
//
//  Created by Carlos Hernández on 15/09/22.
//

import Foundation
import UIKit

class Player {
    
    let id: UUID = UUID()
    let name: String
    var isDead: Bool = false
    var currentSelection: GlassPanel?
    var image: UIImage
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}
