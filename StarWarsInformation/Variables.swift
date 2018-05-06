//
//  Variables.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-04.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import Foundation

struct Variables {
    static var tableType: CellType!
    static var dataArray = [TableViewRowEntry]()
    
    // Current individual info models
    static var character: Character!
    static var species: Species!
    static var planet: Planet!
    static var vehicle: Vehicle!    
}
