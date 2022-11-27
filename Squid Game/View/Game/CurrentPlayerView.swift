//
//  CurrentPlayerView.swift
//  Squid Game
//
//  Created by Carlos Hernández on 16/09/22.
//

import SwiftUI

struct CurrentPlayerView: View {
    
    private let name: String
    private let image: UIImage
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
    
    var body: some View {
        VStack {
            
            Text("Jugador actual:")
                .font(.title)
            
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60, alignment: .center)
            
            Text(name)
                .font(.title2)
        }
    }
}

struct CurrentPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentPlayerView(name: "Carlos", image: UIImage())
    }
}
