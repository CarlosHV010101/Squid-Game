//
//  PlayerView.swift
//  Squid Game
//
//  Created by Carlos Hernández on 15/09/22.
//

import SwiftUI

struct PlayerView: View {
    
    private let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        Text(name)
            .foregroundColor(Color.black)
            .padding(20)
            .overlay(
                Circle()
                    .stroke(lineWidth: 2)
            )
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(name: "Carlos")
    }
}
