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
                
                
                HStack {
                    CustomTextField(
                        text: $viewModel.playerName,
                        placeholder: "Nombre del jugador:",
                        onCommit: viewModel.addPlayer
                    )
                    
                    if viewModel.playerImage != nil {
                        Image(uiImage: viewModel.playerImage!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30, alignment: .center)
                    }
                    
                }
                .padding(.horizontal, 20)
                
                PrimaryButton(
                    text: "Tomar foto",
                    action: { viewModel.showSheet = true }
                )
                
                PrimaryButton(
                    text: "Añadir jugador",
                    action: viewModel.addPlayer
                )
                
                if viewModel.showError {
                    Text(viewModel.error)
                        .foregroundColor(.red)
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    ForEach(viewModel.players, id: \.id) { player in
                        PlayerView(
                            name: player.name,
                            image: player.image
                        )
                    }
                }
            }
            .padding(.leading)
            
            PrimaryButton(
                text: "Revolver jugadores",
                action: { viewModel.presentAlert = true }
            )
            
            NavigationLink(
                destination: PlayersListView(
                    viewModel: PlayersListViewModel(
                        players: viewModel.players)
                )
                .navigationBarHidden(true),
                isActive: $viewModel.goToPlayersList) {
                    EmptyView()
                }
                .hidden()
            
        }
        .padding(.vertical)
        .background(Color.black)
        .alert(isPresented: $viewModel.presentAlert) {
            Alert(
                title: Text("¿Quieres registrar los jugadores?"),
                primaryButton: .default(Text("Si"), action: viewModel.registerPlayers),
                secondaryButton: .cancel()
            )
        }
        .sheet(isPresented: $viewModel.showSheet) {
            ImagePicker(sourceType: .camera, selectedImage: $viewModel.playerImage)
        }
        .onAppear {
            self.viewModel.resetPlayers()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
