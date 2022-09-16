//
//  GlassPanelButtonView.swift
//  Squid Game
//
//  Created by Carlos Hernández on 16/09/22.
//

import SwiftUI

struct GlassPanelButtonView: View {
    
    private let action: (GlassPanel) -> Void
    private let selection: GlassPanel
    
    init(action: @escaping (GlassPanel) -> Void, selection: GlassPanel) {
        self.action = action
        self.selection = selection
    }
    
    var body: some View {
        Button(action: {
            action(selection)
        }) {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 150, height: 150, alignment: .center)
        }
    }
}

struct GlassPanelButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GlassPanelButtonView(action: {_ in }, selection: .right)
    }
}
