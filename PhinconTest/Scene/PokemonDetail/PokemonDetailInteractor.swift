//
//  PokemonDetailInteractor.swift
//  PhinconTest
//
//  Created by Christopher Sonny on 14/06/23.
//  
//

import Foundation
import SwiftyJSON

class PokemonDetailInteractor: PresenterToInteractorPokemonDetailProtocol {
    
    func fetchPokemonDetail(name: String) {
        Request.shared.fetchPokemonDetail(name: name, completionHandler: {
            [weak self] result, error in
            self?.parsePokemonData(json: result)
        })
    }
    
    func parsePokemonData(json: JSON) {
        var arrType: [String] = []
        for item in json["types"].arrayValue {
            arrType.append(item["type"]["name"].stringValue)
        }
        let pokemon = Pokemon.init(name: json["name"].string ?? "", weight: json["weight"].int ?? 0, height: json["height"].int ?? 0, front_default: json["sprites"]["front_default"].string ?? "", type: arrType, order: json["order"].int ?? 0)
        presenter?.updatePokemonData(pokemon: pokemon)
    }
    

    // MARK: Properties
    var presenter: InteractorToPresenterPokemonDetailProtocol?
}
