//
//  HomeRouter.swift
//  PhinconTest
//
//  Created by Christopher Sonny on 14/06/23.
//  
//

import Foundation
import UIKit

class HomeRouter: PresenterToRouterHomeProtocol {
    func goToDetail(name: String, nav: UINavigationController?) {
        if let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PokemonDetailViewController") as? PokemonDetailViewController {
            vc.name = name
            nav?.pushViewController(vc, animated: true)
        } else {
            return
        }
    }
    
    
}
