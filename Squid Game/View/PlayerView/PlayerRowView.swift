//
//  PlayerRowView.swift
//  Squid Game
//
//  Created by Carlos Hernández on 17/09/22.
//

import SwiftUI

struct PlayerRowView: View {
    
    private let name: String
    private let isDead: Bool
    private let image: UIImage
    
    init(name: String, isDead: Bool, image: UIImage) {
        self.name = name
        self.isDead = isDead
        self.image = image
    }
    
    var body: some View {
        HStack {
            
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60, alignment: .center)
                .grayscale(isDead ? 1 : 0)
            
            Text(name)
                .foregroundColor(isDead ? .red : .white)
        }
    }
}

struct PlayerRowView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRowView(
            name: "Carlos",
            isDead: false,
            image: UIImage()
        )
    }
}
