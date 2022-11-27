//
//  GameView.swift
//  Squid Game
//
//  Created by Carlos Hernández on 16/09/22.
//

import SwiftUI

struct GameView: View {
    
    @StateObject private var viewModel: GameViewModel
    private let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.width
    
    init(viewModel: GameViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            
            GamePlayerListView(
                players: $viewModel.players,
                showList: $viewModel.showPlayerList
            )
            .offset(x: viewModel.showPlayerList ? 0 : -SCREEN_WIDTH)
            .zIndex(1)
            
            VStack {
                
                GameToolBarView(
                    leftIconAction: {
                        withAnimation {
                            viewModel.showPlayerList = true
                        }
                    },
                    rightIconAction: {
                        NavigationUtil.popToRootView()
                    }
                )
                .padding()
                
                CurrentPlayerView(
                    name: viewModel.currentPlayer?.name ?? "",
                    image: viewModel.currentPlayer?.image ?? UIImage()
                )
                
                Text("\(viewModel.currentPanelIndex + 1)/\(viewModel.glassPanels.count)")
             
                Spacer()
                
                if viewModel.showWinnerView {
                    WinnerView(players: $viewModel.winners, action: {
                        NavigationUtil.popToRootView()
                    })
                        .padding(.horizontal)
                } else if viewModel.showLoserView {
                    LoserView(action: {
                        NavigationUtil.popToRootView()
                    })
                } else {
                    GameMapView(glassPanels: $viewModel.glassPanels, currentIndex: viewModel.currentPanelIndex)
                        .padding(.leading, 5)
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
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(players: []))
    }
}
