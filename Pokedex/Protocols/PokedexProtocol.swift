//
//  PokedexProtocol.swift
//  Pokedex
//
//  Created by Carlos Paredes León on 02/02/24.
//

import Foundation

protocol PokemonService {
    func fetchRandomPokemon(completion: @escaping (Result<Pokemon, Error>) -> Void)
}
