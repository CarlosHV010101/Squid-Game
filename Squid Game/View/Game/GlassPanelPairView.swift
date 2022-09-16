//
//  GlassPanelPairView.swift
//  Squid Game
//
//  Created by Carlos Hernández on 16/09/22.
//

import SwiftUI

struct GlassPanelPairView: View {
    
    private let glassPanel: GlassPanel
    private let index: Int
    private let currentGlassPanelIndex: Int
    private let totalGlasses: Int
    
    init(glassPanel: GlassPanel,
         index: Int,
         currentGlassPanelIndex: Int,
         totalGlasses: Int
    ) {
        self.glassPanel = glassPanel
        self.index = index
        self.currentGlassPanelIndex = currentGlassPanelIndex
        self.totalGlasses = totalGlasses
    }
    
    var body: some View {
        VStack {                        
            
            if index < currentGlassPanelIndex {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(
                            glassPanel == .left ? .blue : .black
                        )
                    
                    if glassPanel == .left {
                        Circle()
                            .foregroundColor(.green)
                            .frame(width: 10, height: 10)
                    }
                    
                }
                .frame(width: 60, height: 60)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(
                            glassPanel == .right ? .blue : .black
                        )
                    
                    if glassPanel == .right {
                        Circle()
                            .foregroundColor(.green)
                            .frame(width: 10, height: 10)
                    }
                }
                .frame(width: 60, height: 60)
                
            } else {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.blue)
                }
                .frame(width: 60, height: 60)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.blue)
                }
                .frame(width: 60, height: 60)
            }
        }
    }
}

struct GlassPanelPairView_Previews: PreviewProvider {
    static var previews: some View {
        GlassPanelPairView(glassPanel: .left, index: 1, currentGlassPanelIndex: 2, totalGlasses: 2)
    }
}
