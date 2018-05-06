//
//  Character.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-05.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import Foundation

public class Character: SingularInfoModel {
    
    var name: String
    var birthYear: String
    var hairColour: String
    var gender: String
    var height: String
    var eyeColour: String
//    var appearsIn: [String]
    
    public init (name: String, birthYear: String, hairColour:
        String, gender: String, height: String, eyeColour: String) { // }, appearsIn: [String]) {
        self.name = name
        self.birthYear = birthYear
        self.hairColour = hairColour
        self.gender = gender
        self.height = height
        self.eyeColour = eyeColour
//        self.appearsIn = appearsIn
    }
    
}
