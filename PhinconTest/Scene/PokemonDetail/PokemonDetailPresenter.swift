//
//  PokemonDetailPresenter.swift
//  PhinconTest
//
//  Created by Christopher Sonny on 14/06/23.
//  
//

import Foundation

class PokemonDetailPresenter: ViewToPresenterPokemonDetailProtocol {
    func fetchPokemonDetail(name: String) {
        interactor?.fetchPokemonDetail(name: name)
    }
    

    // MARK: Properties
    var view: PresenterToViewPokemonDetailProtocol?
    var interactor: PresenterToInteractorPokemonDetailProtocol?
    var router: PresenterToRouterPokemonDetailProtocol?
}

extension PokemonDetailPresenter: InteractorToPresenterPokemonDetailProtocol {
    func updatePokemonData(pokemon: Pokemon) {
        view?.updatePokemonData(pokemon: pokemon)
    }
    
    
}
