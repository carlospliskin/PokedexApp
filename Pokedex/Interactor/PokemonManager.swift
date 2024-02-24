//
//  PokemonManager.swift
//  Pokedex
//
//  Created by Carlos Paredes León on 02/02/24.
//

import SwiftUI
import Combine

class APIClient: PokemonService {
    func fetchRandomPokemon(completion: @escaping (Result<Pokemon, Error>) -> Void) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(Int.random(in: 1...898))") else {
            return completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data,
               let decodedPokemon = try? JSONDecoder().decode(Pokemon.self, from: data) {
                completion(.success(decodedPokemon))
            } else if let error = error {
                completion(.failure(error))
            }
        }.resume()
    }
}

