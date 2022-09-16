//
//  ContentView.swift
//  Squid Game
//
//  Created by Carlos Hernández on 15/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            NavigationView {
                MainView(viewModel: MainViewModel())
                    .navigationBarHidden(true)
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
