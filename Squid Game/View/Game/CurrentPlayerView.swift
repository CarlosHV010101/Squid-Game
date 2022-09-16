//
//  CurrentPlayerView.swift
//  Squid Game
//
//  Created by Carlos Hernández on 16/09/22.
//

import SwiftUI

struct CurrentPlayerView: View {
    
    private let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        VStack {
            
            Text("Jugador actual:")
                .font(.title)
            
            Text(name)
                .font(.title2)
        }
    }
}

struct CurrentPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentPlayerView(name: "Carlos")
    }
}
