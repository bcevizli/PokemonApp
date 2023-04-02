//
//  PokemonListViewCell.swift
//  PokemonApp
//
//  Created by Adem Burak Cevizli on 23.03.2023.
//

import UIKit

class PokemonListViewCell: UITableViewCell {
    static let name = String(describing: PokemonListViewCell.self)
    
    private var imgPokemon: UIImageView!
    private var lblPokemon = UILabel()
    var viewModel: PokemonDetailViewModel? {
        didSet {
            populateCell()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgPokemon.image = nil
    }

    func createCell() {
        
        self.selectionStyle = .none
        
        imgPokemon = UIImageView()
        self.addSubview(imgPokemon)
        
        lblPokemon = UILabel()
        self.addSubview(lblPokemon)
        
        imgPokemon.translatesAutoresizingMaskIntoConstraints = false
        imgPokemon.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imgPokemon.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imgPokemon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        imgPokemon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imgPokemon.clipsToBounds = true
        imgPokemon.contentMode = .scaleAspectFit
        
        lblPokemon.translatesAutoresizingMaskIntoConstraints = false
        lblPokemon.font = UIFont.systemFont(ofSize: 25)
        lblPokemon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        lblPokemon.leadingAnchor.constraint(equalTo: imgPokemon.trailingAnchor, constant: 10).isActive = true
        lblPokemon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10).isActive = true
        lblPokemon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    func populateCell() {
        imgPokemon.image(from: viewModel?.getImageUrl() ?? "", placeHolder: UIImage(systemName: "photo")!)
        lblPokemon.text = viewModel?.getName()
    }
}
