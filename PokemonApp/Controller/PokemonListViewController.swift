//
//  ViewController.swift
//  PokemonApp
//
//  Created by Adem Burak Cevizli on 23.03.2023.
//

import UIKit

class PokemonListViewController: UIViewController {

    private let viewModel = PokemonListViewViewModel()
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPage()
    }
    
    private func initPage() {
        createTableView()
        view.backgroundColor = .black
        title = "Pokemon"
        viewModel.delegate = self
        viewModel.fetchPokemons()
    }
    
    private func createTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 50
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        
        tableView.register(PokemonListViewCell.self, forCellReuseIdentifier: PokemonListViewCell.name)
    }
}

extension PokemonListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListViewCell.name) as? PokemonListViewCell {
            cell.viewModel = PokemonDetailViewViewModel(pokemon: viewModel.getDetails(index: indexPath.row))
            
            if viewModel.mustRefreshPage(with: indexPath.row) {
                viewModel.fetchPokemons()
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PokemonDetailViewController()
        vc.setup(with: viewModel.getDetails(index: indexPath.row))
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension PokemonListViewController: PokemonListViewViewModelDelegate {
    
    func didGetAllPokemonDetails() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

