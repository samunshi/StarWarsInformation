//
//  Movie.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-13.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import Foundation

public class Movie {
    var name: String!
    var imdbUrl: String!
    
    public init(name: String, imdbUrl: String) {
        self.name = name
        self.imdbUrl = imdbUrl
    }    
}
