//
//  InformationClient.swift
//  StarWarsInformation
//
//  Handles the API calls to gather all the required information to populate app screens
//
//  Created by Satwik Munshi on 2018-05-02.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class InformationClient {
    
    var tableViewEntries: [TableViewRowEntry]!
    
    // Get Request for initial screen population
    public func getInitialScreenPopulationData(type: CellType) {
        let requestURL: String = generateInitialScreenPopulationURL(type: type)
        Alamofire.request(requestURL, method: .get).validate().responseJSON { response in
            switch response.result {
                
            case .success(let value):
                let json = JSON(value)
                print(json)
             
            case .failure(let error):
                print("GET request for initial screen population failed with error: \(error.localizedDescription)")
            }
        }
        
    }
    
    // Get request for specific screen population
    public func getSpecificInformationAboutEntity(tableViewEntry: TableViewRowEntry) {
        let requestURL: String = tableViewEntry.getUniqueInfoURL()
        Alamofire.request(requestURL, method: .get).validate().responseJSON { response in
            switch response.result {
                
            case .success(let value):
                let json = JSON(value)
                print(json)
                
            case .failure(let error):
                print("GET request for specific screen population failed with error: \(error.localizedDescription)")
                
            }
        }
    }
    
    public func getTableViewEntries() -> Int {
        return tableViewEntries.count        
    }
    
    private func generateInitialScreenPopulationURL(type: CellType) -> String {
        var baseURL: String = "https://swapi.co/api"
        
        switch type {
        case CellType.character:
            baseURL.append("/people")
            return baseURL
        case CellType.planet:
            baseURL.append("/planets")
            return baseURL
        case CellType.species:
            baseURL.append("/species")
            return baseURL
        case CellType.vehicle:
            baseURL.append("/vehicles")
            return baseURL
        }
    }
}

