//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Carlos Paredes León on 02/02/24.
//

import Foundation

class PokemonViewModel: ObservableObject {
    @Published var pokemon: Pokemon?
    private let pokemonService: PokemonService

    init(pokemonService: PokemonService = APIClient()) {
        self.pokemonService = pokemonService
        fetchRandomPokemon()
    }

    func fetchRandomPokemon() {
        pokemonService.fetchRandomPokemon { [weak self] result in
            switch result {
            case .success(let decodedPokemon):
                DispatchQueue.main.async {
                    self?.pokemon = decodedPokemon
                }
            case .failure(let error):
                print("Error fetching Pokémon: \(error)")
            }
        }
    }
}
