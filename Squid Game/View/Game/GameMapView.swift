//
//  GameMap.swift
//  Squid Game
//
//  Created by Carlos Hernández on 16/09/22.
//

import SwiftUI

struct GameMapView: View {
    
    @Binding private var glassPanels: [GlassPanel]
    private let currentIndex: Int
    
    init(glassPanels: Binding<[GlassPanel]>, currentIndex: Int) {
        self._glassPanels = glassPanels
        self.currentIndex = currentIndex
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<glassPanels.count, id: \.self) { index in
                    GlassPanelPairView(
                        glassPanel: glassPanels[index],
                        index: index,
                        currentGlassPanelIndex: currentIndex,
                        totalGlasses: glassPanels.count - 1
                    )
                }
            }
        }
    }
}

struct GameMap_Previews: PreviewProvider {
    static var previews: some View {
        GameMapView(glassPanels: .constant([]), currentIndex: 1)
    }
}
