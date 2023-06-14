//
//  SimplePokemon.swift
//  PhinconTest
//
//  Created by Christopher Sonny on 14/06/23.
//

import Foundation

struct SimplePokemon {
    var url: String
    var name: String
    public init(url: String, name: String) {
        self.url = url
        self.name = name
    }
}

struct Pokemon {
    var name: String
    var weight: Int
    var height: Int
    var front_default: String
    var type: [String]
    var order: Int
    
    public init(name: String, weight: Int, height: Int, front_default: String, type: [String], order: Int) {
        self.name = name
        self.weight = weight
        self.height = height
        self.front_default = front_default
        self.type = type
        self.order = order
    }
}

