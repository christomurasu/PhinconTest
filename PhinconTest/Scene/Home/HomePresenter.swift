//
//  HomePresenter.swift
//  PhinconTest
//
//  Created by Christopher Sonny on 14/06/23.
//  
//

import Foundation
import UIKit

class HomePresenter: ViewToPresenterHomeProtocol {
    func goToDetail(name: String, nav: UINavigationController?) {
        router?.goToDetail(name: name, nav: nav)
    }
    
    func fetchPokemon(page: Int) {
        interactor?.fetchPokemonData(page: page)
    }
    

    // MARK: Properties
    var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    func updateSimplePokemonList(arrPokemon: [SimplePokemon]) {
        view?.updatePokemonList(arrSimplePokemon: arrPokemon)
    }
}
