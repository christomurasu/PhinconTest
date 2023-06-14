//
//  HomeInteractor.swift
//  PhinconTest
//
//  Created by Christopher Sonny on 14/06/23.
//  
//

import Foundation
import SwiftyJSON

class HomeInteractor: PresenterToInteractorHomeProtocol {
    var arrSimplePokemon: [SimplePokemon] = []
    func fetchPokemonData(page: Int) {
        let offset = page*20
        Request.shared.fetchPokemon(offset: offset, completionHandler: {
            result, error in
            if let result = result["results"].array {
                self.parseDataToObject(data: result, page: page)
            }
        })
    }
    
    func parseDataToObject(data: [JSON], page: Int) {
        if page <= 1 {
            arrSimplePokemon.removeAll()
        }
        
        for item in data {
            arrSimplePokemon.append(SimplePokemon.init(url: item["url"].string ?? "", name: item["name"].string ?? ""))
        }
        
        presenter?.updateSimplePokemonList(arrPokemon: arrSimplePokemon)
    }
    

    // MARK: Properties
    var presenter: InteractorToPresenterHomeProtocol?
}
