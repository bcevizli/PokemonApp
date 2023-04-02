//
//  PokemonListViewService.swift
//  PokemonApp
//
//  Created by Adem Burak Cevizli on 23.03.2023.
//

import Foundation

struct PokemonListViewService: PokeRequest {
    
    var queryItems: [String : String] {
        let pagination = Pagination()
        var items = [String : String]()
        items["limit"] = String(pagination.limit)
        items["offset"] = String(pagination.offset)
        
        return items
    }
    
    var url: String
    
    var api = "pokemon"
        
    var method: HTTPMethod {
        .get
    }
    
    init(url: String? = nil) {
        self.url = url ?? ""
        
        if self.url.isEmpty {
            self.url = createUrl()
        }
    }
    
    func decode(_ data: Data) throws -> AllPokemons? {
        let decoder = JSONDecoder()
        let response = try decoder.decode(AllPokemons.self, from: data)
        return response
    }
    
    private func createUrl() -> String {
        var urlComps = URLComponents(string: PokemonListViewService.baseUrl)!
        urlComps.path.append(contentsOf: api)
        queryItems.keys.forEach {
            let urlQueryItem = URLQueryItem(name: $0, value: queryItems[$0])
            urlComps.queryItems?.append(urlQueryItem)
        }
        return urlComps.url?.absoluteString ?? ""
    }
    
}

struct Pagination {
    var limit = 20
    var offset = 0
}
