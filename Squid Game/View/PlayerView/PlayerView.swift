//
//  PlayerView.swift
//  Squid Game
//
//  Created by Carlos Hernández on 15/09/22.
//

import SwiftUI

struct PlayerView: View {
    
    private let name: String
    private let image: UIImage
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
    
    var body: some View {
        
        VStack {
            
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .center)
                
            Text(name)
                .foregroundColor(.white)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(name: "Carlos", image: UIImage())
    }
}
