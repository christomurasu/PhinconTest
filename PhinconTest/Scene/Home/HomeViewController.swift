//
//  HomeViewController.swift
//  PhinconTest
//
//  Created by Christopher Sonny on 14/06/23.
//  
//

import UIKit

class HomeViewController: UIViewController {
    
    var page = 1
    var arrSimplePokemon: [SimplePokemon] = []
    @IBOutlet weak var pokemonTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupPresenter()
        setupView()
    }
    
    func setupPresenter() {
        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter()
        
        self.presenter = presenter
        self.presenter?.router = HomeRouter()
        self.presenter?.view = self
        self.presenter?.interactor = HomeInteractor()
        self.presenter?.interactor?.presenter = presenter
    }
    
    func setupView() {
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        presenter?.fetchPokemon(page: page)
    }

    // MARK: - Properties
    var presenter: ViewToPresenterHomeProtocol?
    
}

extension HomeViewController: PresenterToViewHomeProtocol{
    func updatePokemonList(arrSimplePokemon: [SimplePokemon]) {
        self.arrSimplePokemon = arrSimplePokemon
        self.pokemonTableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSimplePokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = arrSimplePokemon[indexPath.row].name
        if indexPath.row == arrSimplePokemon.count-1 {
            self.page+=1
            self.presenter?.fetchPokemon(page: page)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.goToDetail(name: arrSimplePokemon[indexPath.row].name, nav: self.navigationController)
    }
    
    
}
