//
//  dataStructs.swift
//  Pokedex
//
//  Created by Carlos Paredes León on 02/02/24.
//

import Foundation

struct Pokemon: Codable {
    let name: String
    let sprites: Sprites
}

struct Sprites: Codable {
    let front_default: String?
}
