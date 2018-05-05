//
//  Planet.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-05.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import Foundation

public class Planet: SingularInfoModel {
    
    var name: String
    var climate: String
    var diamater: String
    var gravity: String
    var orbitalPeriod: String
    var population: String
    var terrain: String
    
    public init(name: String, climate: String, diameter: String, gravity: String,
                orbitalPeriod: String, population: String, terrain: String) {
        self.name = name
        self.climate = climate
        self.diamater = diameter
        self.gravity = gravity
        self.orbitalPeriod = orbitalPeriod
        self.population = population
        self.terrain = terrain
    }
}
