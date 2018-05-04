//
//  TableViewRowEntry.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-02.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import Foundation

public class TableViewRowEntry {
    
    var type: CellType
    var name: String
    var uniqueInfoURL: String
    
    
    public init(type: CellType, name: String, uniqueInfoURL: String) {
        self.type = type
        self.name = name
        self.uniqueInfoURL = uniqueInfoURL
    }
    
    public func getName() -> String {
        return self.name
    }
    
    public func getUniqueInfoURL() -> String {
        return self.uniqueInfoURL
    }

    
}
