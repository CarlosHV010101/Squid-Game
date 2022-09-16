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
        VStack {
            
            Text("Orden de los jugadores")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    ForEach(0..<$viewModel.players.count) { index in
                        
                        HStack {
                                                                        
                            Text("\(index + 1).")
                                .bold()
                            
                            Text(viewModel.players[index].name)
                                .bold()
                            
                            Spacer()
                        }
                        
                    }
                }
                .padding(.leading, 30)
            }
            
            PrimaryButton(text: "Iniciar partida", action: {})
        }
        .padding(.vertical, 30)
        .background(Color.black)        
    }
}

struct PlayersListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersListView(viewModel: PlayersListViewModel(players: []))
    }
}
