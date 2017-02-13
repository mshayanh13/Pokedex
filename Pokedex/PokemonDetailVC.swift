//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Mohammad Hemani on 2/12/17.
//  Copyright © 2017 Mohammad Hemani. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name
        
    }

}
