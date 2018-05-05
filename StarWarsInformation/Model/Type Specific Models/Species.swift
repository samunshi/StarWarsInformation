//
//  Species.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-05.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import Foundation

public struct Species {
    var name: String
    var averageHeight: String
    var classification: String
    var homeworld: String
    var language: String
    var skinColour: String
    var hairColour: String
    
    public init(name: String, averageHeight: String, classification: String,
                homeworld: String, language: String, skinColour: String,
                hairColour: String) {
        self.name = name
        self.averageHeight = averageHeight
        self.classification = classification
        self.homeworld = homeworld
        self.language = language
        self.skinColour = skinColour
        self.hairColour = hairColour
        
    }
}
