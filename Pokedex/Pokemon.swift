//
//  Pokemon.swift
//  Pokedex
//
//  Created by Mohammad Hemani on 2/11/17.
//  Copyright © 2017 Mohammad Hemani. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _baseAttack: String!
    private var _nextEvolutionText: String!
    private var _pokemonURL: String!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var description: String {
        
        if _description == nil {
            
            _description = ""
        }
        
        return _description
        
    }
    
    var type: String {
        
        
        if _type == nil {
            
            _type = ""
            
        }
        
        return _type
        
    }
    
    var defense: String {
        
        if _defense == nil {
            
            _defense = ""
            
        }
        
        return _defense
        
    }
    
    var weight: String {
        
        
        if _weight == nil {
            
            _weight = ""
            
        }
        
        return _weight
        
    }
    
    var height: String {
        
        if _height == nil {
            
            _height = ""
            
        }
        
        return _height
        
    }
    
    var baseAttack: String {
        
        if _baseAttack == nil {
            
            _baseAttack = ""
            
        }
        
        return _baseAttack
        
    }
    
    var nextEvolutionText: String {
        
        if _nextEvolutionText == nil {
            
            _nextEvolutionText = ""
            
        }
        
        return _nextEvolutionText
        
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(pokedexId)/"
        
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            
            //print(response.result.value)
            
            if let dict = response.result.value as? Dictionary<String, Any> {
                
                if let weight = dict["weight"] as? String {
                    
                    self._weight = weight
                    
                }
                
                if let height = dict["height"] as? String {
                    
                    self._height = height
                    
                }
                
                if let attack = dict["attack"] as? Int {
                    
                    self._baseAttack = "\(attack)"
                    
                }
                
                if let defense = dict["defense"] as? Int {
                    
                    self._defense = "\(defense)"
                    
                }
                
                print(self._weight)
                print(self._height)
                print(self._baseAttack)
                print(self._defense)
                
                if let types = dict["types"] as? [Dictionary<String, String>] , types.count > 0 {
                    
                    if let name = types[0]["name"] {
                        
                        self._type = name.capitalized
                        
                    }
                    
                    if types.count > 1 {
                        
                        for x in 1..<types.count {
                            
                            if let name = types[x]["name"] {
                                
                                self._type! += "/\(name.capitalized)"
                                
                            }
                            
                        }
                        
                    }
                    
                    print(self._type)
                    
                } else {
                    
                    self._type = ""
                    
                }
                
            }
            
            completed()
        }
        
    }
}
