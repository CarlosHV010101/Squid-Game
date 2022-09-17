//
//  GameView.swift
//  Squid Game
//
//  Created by Carlos Hernández on 16/09/22.
//

import SwiftUI

struct GameView: View {
    
    @StateObject private var viewModel: GameViewModel
    
    init(viewModel: GameViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            
            GameToolBarView(
                leftIconAction: {
                    viewModel.showPlayerList = true
                },
                rightIconAction: {
                    //End game
                }
            )
            
            CurrentPlayerView(name: viewModel.currentPlayer?.name ?? "")
            
            Text("\(viewModel.currentPanelIndex + 1)/\(viewModel.glassPanels.count)")
         
            Spacer()
            
            if viewModel.showWinnerView {
                WinnerView(players: $viewModel.winners, action: {})
            } else if viewModel.showLoserView {
                LoserView(action: {})
            } else {
                GameMapView(glassPanels: $viewModel.glassPanels, currentIndex: viewModel.currentPanelIndex)
            }
            
            Spacer()
            
            if viewModel.showGlassPanelOptions {
                GameOptionsView(
                    selectGlassPanel: viewModel.selectGlassPanel
                )                
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(players: []))
    }
}
