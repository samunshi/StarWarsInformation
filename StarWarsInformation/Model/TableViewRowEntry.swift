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
    var uniqueId: Int
    
    
    public init(type: CellType, name: String, uniqueId: Int) {
        self.type = type
        self.name = name
        self.uniqueId = uniqueId
    }
    
    public func getName() -> String {
        return self.name
    }
    
    public func getUniqueId() -> Int {
        return self.uniqueId
    }

    
}
