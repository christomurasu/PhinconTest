//
//  PokemonDetailViewController.swift
//  PhinconTest
//
//  Created by Christopher Sonny on 14/06/23.
//  
//

import UIKit
import Kingfisher

class PokemonDetailViewController: UIViewController {
    
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    var name: String?
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupPresenter() {
        let presenter: ViewToPresenterPokemonDetailProtocol & InteractorToPresenterPokemonDetailProtocol = PokemonDetailPresenter()
        
        self.presenter = presenter
        self.presenter?.router = PokemonDetailRouter()
        self.presenter?.view = self
        self.presenter?.interactor = PokemonDetailInteractor()
        self.presenter?.interactor?.presenter = presenter
    }

    // MARK: - Properties
    var presenter: ViewToPresenterPokemonDetailProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupPresenter()
        guard let name = self.name else { return }
        presenter?.fetchPokemonDetail(name: name)
    }
}

extension PokemonDetailViewController: PresenterToViewPokemonDetailProtocol{
    func updatePokemonData(pokemon: Pokemon) {
        nameLabel.text = pokemon.name
        weightLabel.text = "Weight : \(pokemon.weight)"
        heightLabel.text = "Height \(pokemon.height)"
        orderLabel.text = "Order \(pokemon.order)"
        var type = "Type : "
        for item in pokemon.type {
            type = "\(type)\n\(item)"
        }
        typeLabel.text = type
        if let url = URL(string: pokemon.front_default) {
            KF.url(url)
              .loadDiskFileSynchronously()
              .set(to: self.pokemonImage)
        }
    }
    
    // TODO: Implement View Output Methods
}
