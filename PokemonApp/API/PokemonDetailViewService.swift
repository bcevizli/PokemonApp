//
//  PokemonDetailViewService.swift
//  PokemonApp
//
//  Created by Adem Burak Cevizli on 23.03.2023.
//

import Foundation

struct PokemonDetailService: PokeRequest {
        
    var api = "pokemon"
    var url: String
    var method: HTTPMethod {
        .get
    }
    
    init(pokemon: Pokemon) {
        var url = URL(string: PokemonListViewService.baseUrl)
        url?.appendPathComponent(api)
        url?.appendPathComponent(pokemon.name ?? "")
        self.url = url?.absoluteString ?? ""
    }
    
    func decode(_ data: Data) throws -> PokemonDetail? {
        let decoder = JSONDecoder()
        let response = try decoder.decode(PokemonDetail.self, from: data)
        return response
    }
}

