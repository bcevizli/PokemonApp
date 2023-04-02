//
//  UIImageView.swift
//  PokemonApp
//
//  Created by Adem Burak Cevizli on 23.03.2023.
//

import UIKit

extension UIImageView {
    
    public func image(from urlString: String, placeHolder: UIImage) {
        
        if image == nil {
            image = placeHolder
        }
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { [weak self] (data, response, error) -> Void in
            
            if let error = error {
                debugPrint(error)
                return
            }
            
            DispatchQueue.main.async {
                if let data = data {
                    self?.image = UIImage(data: data)
                }
            }
            
        }).resume()
    }
}

