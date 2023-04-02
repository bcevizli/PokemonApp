//
//  AllPokemons.swift
//  PokemonApp
//
//  Created by Adem Burak Cevizli on 23.03.2023.
//

import Foundation

struct AllPokemons: Codable {
    
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Pokemon]?
    
}

