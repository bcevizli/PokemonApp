//
//  PokemonDetailViewViewModel.swift
//  PokemonApp
//
//  Created by Adem Burak Cevizli on 23.03.2023.
//

import Foundation
import UIKit

class PokemonDetailViewModel {
    
    private let pokemon: PokemonDetail
    
    init(pokemon: PokemonDetail) {
        self.pokemon = pokemon
    }
    
    private func getTypes() -> String {
        guard let types = pokemon.types else { return "" }
        
        var typeStr = ""
        
        for type in types {
            typeStr.append((type.type?.name?.capitalized ?? "") + " ")
        }
        
        return "TYPE: " + typeStr.uppercased()
    }
    
    private func getStats() -> String {
        guard let stats = pokemon.stats else { return "" }
        
        var statsStr = ""
        
        for stat in stats {
            let name = (stat.stat?.name ?? "").uppercased()
            let baseStat = "\(stat.base_stat ?? 0)"
            statsStr.append(name + ": " + baseStat)
            statsStr.append("\n")
        }
        
        if let weight = pokemon.weight {
            statsStr.append("WEIGHT: " + "\(weight)")
        }
        
        return statsStr
    }
    
    final func getDetails() -> String {
        let details = getTypes() + "\n" + getStats()
        return details.replacingOccurrences(of: "-", with: " ")
    }
    
    final func getName() -> String {
        return pokemon.name?.capitalized ?? ""
    }
    
    final func getImageUrl() -> String {
        if let image = pokemon.sprites?.front_default {
            return image
        } else if let image = pokemon.sprites?.front_female {
            return image
        }
        
        return ""
    }
}
