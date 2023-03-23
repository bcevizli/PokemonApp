//
//  PokemonDetail.swift
//  PokemonApp
//
//  Created by Adem Burak Cevizli on 23.03.2023.
//

import Foundation

struct PokemonDetail: Codable {

    let base_experience: Int?
    let forms: [Form]?
    let height: Int?
    let id: Int?
    let moves: [Form]?
    let name: String?
    let species: Form?
    let sprites: Sprite?
    let stats: [Stat]?
    let types: [PokemonType]?
    let weight: Int?
}

struct Stat: Codable {

    let base_stat: Int?
    let effort: Int?
    let stat: Form?
}

struct Sprite: Codable {
    
    let back_default: String?
    let back_female: String?
    let back_shiny: String?
    let back_shiny_female: String?
    let front_default: String?
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
}

struct Form: Codable {
    
    let name: String?
    let url: String?
}

struct PokemonType: Codable {

    let slot: Int?
    let type: Form?
}
