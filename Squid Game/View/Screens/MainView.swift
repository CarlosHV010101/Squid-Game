//
//  MainView.swift
//  Squid Game
//
//  Created by Carlos Hernández on 15/09/22.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            
            VStack(spacing: 20) {
                Text("Squid Game")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                Text("Ingrese el nombre de un jugador")
                    .foregroundColor(.white)
                
                CustomTextField(
                    text: $viewModel.playerName,
                    placeholder: "Nombre del jugador:",
                    onCommit: viewModel.addPlayer
                )
                .padding(.horizontal, 20)
                
                PrimaryButton(
                    text: "Añadir jugador",
                    action: viewModel.addPlayer
                )
                
                if viewModel.showError {
                    Text(viewModel.error)
                        .foregroundColor(.red)
                }
            }
            
            VStack {
                Spacer()
                
                ForEach(viewModel.players, id: \.id) { player in
                    HStack {
                        Text(player.name)
                    }
                }
                
                Spacer()
            }
            
            PrimaryButton(
                text: "Comenzar partida",
                action: viewModel.startGame
            )
            
        }
        .padding(.vertical)
        .background(Color.black)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
