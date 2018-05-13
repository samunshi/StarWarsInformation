//
//  Species.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-05.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import Foundation

public class Species: SingularInfoModel {
    
    var name: String
    var averageHeight: String
    var classification: String
//    var homeworld: String
    var language: String
    var skinColours: String
    var hairColours: String
    var movieUrls: [String]
    
    public init(name: String, averageHeight: String, classification: String, language: String, skinColours: String,
                hairColours: String, movieUrls: [String]) {
        self.name = name
        self.averageHeight = averageHeight
        self.classification = classification
     //   self.homeworld = homeworld
        self.language = language
        self.skinColours = skinColours
        self.hairColours = hairColours
        self.movieUrls = movieUrls
        
    }
}
