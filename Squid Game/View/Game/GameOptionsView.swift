//
//  GameOptions.swift
//  Squid Game
//
//  Created by Carlos Hernández on 16/09/22.
//

import SwiftUI

struct GameOptionsView: View {
    
    private let selectGlassPanel: (GlassPanel) -> Void
    
    init(selectGlassPanel: @escaping (GlassPanel) -> Void) {
        self.selectGlassPanel = selectGlassPanel
    }
    
    var body: some View {
        VStack {
            
            Text("Seleccione un panel:")
            
            HStack {
                                
                GlassPanelButtonView(action: selectGlassPanel, selection: .left)
                
                GlassPanelButtonView(action: selectGlassPanel, selection: .right)
            }
            
        }
    }
}

struct GameOptions_Previews: PreviewProvider {
    static var previews: some View {
        GameOptionsView(selectGlassPanel: { _ in  })
    }
}
