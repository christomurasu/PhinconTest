//
//  PokemonDetailContract.swift
//  PhinconTest
//
//  Created by Christopher Sonny on 14/06/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewPokemonDetailProtocol {
    func updatePokemonData(pokemon: Pokemon)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterPokemonDetailProtocol {
    
    var view: PresenterToViewPokemonDetailProtocol? { get set }
    var interactor: PresenterToInteractorPokemonDetailProtocol? { get set }
    var router: PresenterToRouterPokemonDetailProtocol? { get set }
    
    func fetchPokemonDetail(name: String) 
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorPokemonDetailProtocol {
    
    var presenter: InteractorToPresenterPokemonDetailProtocol? { get set }
    
    func fetchPokemonDetail(name: String)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterPokemonDetailProtocol {
    func updatePokemonData(pokemon: Pokemon)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterPokemonDetailProtocol {
    
}
