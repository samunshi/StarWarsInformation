//
//  Vehicle.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-05.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import Foundation

public class Vehicle: SingularInfoModel {
    
    var name: String
    var type: String
    var cargoCapacity: String
    var crew: String
    var cost: String
    var length: String
    var manufacturer: String
    var passengers: String
    var movieUrls: [String]
    
    public init (name: String, type: String, cargoCapacity: String, crew: String,
                 cost: String, length: String, manufacturer: String, passengers: String, movieUrls: [String]) {
        
        self.name = name
        self.type = type
        self.cargoCapacity = cargoCapacity
        self.crew = crew
        self.cost = cost
        self.length = length
        self.manufacturer = manufacturer
        self.passengers = passengers
        self.movieUrls = movieUrls
        
    }
    
}
