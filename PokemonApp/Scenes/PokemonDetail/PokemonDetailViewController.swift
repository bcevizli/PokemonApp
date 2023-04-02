//
//  PokemonDetailViewController.swift
//  PokemonApp
//
//  Created by Adem Burak Cevizli on 23.03.2023.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    private var viewModel: PokemonDetailViewModel?
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let imgPokemon = UIImageView()
        
    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPage()
    }
    
    func setup(with pokemon: PokemonDetail) {
        viewModel = PokemonDetailViewModel(pokemon: pokemon)
    }
    
    private func initPage() {
        title = viewModel?.getName()
        view.backgroundColor = .black
        setupScrollView()
        setupViews()
        setDetails()
    }
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func setupViews(){
        imgPokemon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imgPokemon)
        
        imgPokemon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imgPokemon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        imgPokemon.heightAnchor.constraint(equalToConstant: 300).isActive = true
        imgPokemon.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        imgPokemon.image(from: viewModel?.getImageUrl() ?? "",
                                      placeHolder: UIImage(systemName: "house")!)
        
        contentView.addSubview(detailsLabel)
        detailsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        detailsLabel.topAnchor.constraint(equalTo: imgPokemon.bottomAnchor, constant: 15).isActive = true
        detailsLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
        detailsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func setDetails() {
        detailsLabel.text = viewModel?.getDetails()
    }
}
