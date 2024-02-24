//
//  ContentView.swift
//  Pokedex
//
//  Created by Carlos Paredes León on 01/02/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PokemonViewModel()

    var body: some View {
        ZStack {
            Image("pokedex-small")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                if let pokemon = viewModel.pokemon {
                    AsyncImage(url: URL(string: pokemon.sprites.front_default ?? "")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                        case .failure:
                            Text("No se pudo cargar la imagen")
                        @unknown default:
                            EmptyView()
                        }
                    }

                    Text("Nombre: \(pokemon.name.capitalized)")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)

                    Spacer()
                } else {
                    ProgressView()
                }

                Button("Mostrar Pokémon") {
                    viewModel.fetchRandomPokemon()
                }
                .padding()
                .foregroundColor(.white)
            }
            .padding()
        }
        .onAppear {
            viewModel.fetchRandomPokemon()
            Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { timer in
                viewModel.fetchRandomPokemon()
            }
        }
        .statusBar(hidden: true) 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
