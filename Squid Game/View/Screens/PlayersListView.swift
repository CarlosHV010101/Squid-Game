//
//  PlayersListView.swift
//  Squid Game
//
//  Created by Carlos Hernández on 15/09/22.
//

import SwiftUI

struct PlayersListView: View {
    
    @StateObject private var viewModel: PlayersListViewModel
    
    init(viewModel: PlayersListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Orden de los jugadores")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                ScrollView {
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        ForEach(0..<$viewModel.players.count, id: \.self) { index in
                            
                            HStack {
                                                                            
                                Text("\(index + 1).")
                                    .bold()
                                
                                Image(uiImage: viewModel.players[index].image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30, alignment: .center)
                                
                                Text(viewModel.players[index].name)
                                    .bold()
                                
                                Spacer()
                            }
                            
                        }
                    }
                    .padding(.leading, 30)
                }
                
                PrimaryButton(text: "Iniciar partida", action: {
                    viewModel.goToGame = true
                })
                
                NavigationLink(
                    destination: GameView(
                        viewModel: GameViewModel(
                            players: viewModel.players
                        )
                    )
                    .navigationBarHidden(true),
                    isActive: $viewModel.goToGame) {
                        EmptyView()
                    }
                    .hidden()
            }
            .padding(.vertical, 30)
            .background(Color.black)
            .navigationBarHidden(true)
        }
    }
}

struct PlayersListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersListView(viewModel: PlayersListViewModel(players: []))
    }
}
