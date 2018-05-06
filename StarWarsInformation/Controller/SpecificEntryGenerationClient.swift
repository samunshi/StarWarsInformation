//
//  SpecificEntryGenerationClient.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-05.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import Foundation
import SwiftyJSON

public class SpecificEntryGenerationClient {
    
    let infoClient: InformationApiClient = InformationApiClient()
    let group = DispatchGroup()
    
    public func getCharacterEntryInformation(url: String, completion: @escaping (Character) -> Void) {
        var characterToReturn: Character!
        
        group.enter()
        getUniqueEntryInformation(url: url, type: CellType.character) { (character) in
            guard let c = character as? Character else {
                fatalError("Could not parse to character type!")
            }
            characterToReturn = c
            self.group.leave()
        }
        
        group.notify(queue: .main) {
            print ("Request completed")
            completion(characterToReturn)
        }
    }
    
    public func getPlanetEntryInformation(url: String, completion: @escaping (Planet) -> Void) {
        var planetToReturn: Planet!
        
        group.enter()
        getUniqueEntryInformation(url: url, type: CellType.planet) { (planet) in
            guard let p = planet as? Planet else {
                fatalError("Could not parse to planet type!")
            }
            planetToReturn = p
            self.group.leave()
        }
        
        group.notify(queue: .main) {
            print ("Request completed")
            completion(planetToReturn)
        }
    }
    
    public func getSpeciesEntryInformation(url: String, completion: @escaping (Species) -> Void) {
        var speciesToReturn: Species!
        
        group.enter()
        getUniqueEntryInformation(url: url, type: CellType.species) { (species) in
            guard let s = species as? Species else {
                fatalError("Could not parse to species type!")
            }
            speciesToReturn = s
            self.group.leave()
        }
        
        group.notify(queue: .main) {
            print ("Request completed")
            completion(speciesToReturn)
        }
        
    }
    
    public func getVehiclesEntryInformation(url: String, completion: @escaping (Vehicle) -> Void) {
        var vehicleToReturn: Vehicle!
        
        group.enter()
        getUniqueEntryInformation(url: url, type: CellType.vehicle) { (vehicle) in
            guard let v = vehicle as? Vehicle else {
                fatalError("Could not parse to vehicle type!")
            }
            vehicleToReturn = v
            self.group.leave()
        }
        
        group.notify(queue: .main) {
            print ("Request completed")
            completion(vehicleToReturn)
        }
        
    }
    
    public func getUniqueEntryInformation(url: String, type: CellType, completion: @escaping (SingularInfoModel) -> Void) {
        
        infoClient.getSpecificInformationAboutEntity(requestURL: url) { (json) in
            switch type {
            case CellType.character:
                completion(self.generateCharacterModel(json: json))
                break
            case CellType.planet:
                completion(self.generatePlanetModel(json: json))
                break
            case CellType.species:
                completion(self.generateSpeciesModel(json: json))
                break
            case CellType.vehicle:
                completion(self.generateVehicleModel(json: json))
                break
            }
        }
    }

    private func generateCharacterModel(json: JSON) -> Character {
        let name = json["name"].stringValue
        let birthYear = json["birth_year"].stringValue
        let hairColour = json["hair_colour"].stringValue
        let gender = json["gender"].stringValue
        let height = json["height"].stringValue
        let eyeColour = json["eye_colour"].stringValue
        
        return Character(name: name, birthYear: birthYear, hairColour: hairColour, gender: gender, height: height, eyeColour: eyeColour)
        
    }
    
    private func generatePlanetModel(json: JSON) -> Planet {
        let name = json["name"].stringValue
        let climate = json["climate"].stringValue
        let diamater = json["diameter"].stringValue
        let gravity = json["gravity"].stringValue
        let orbitalPeriod = json["orbital_period"].stringValue
        let population = json["population"].stringValue
        let terrain = json["terrain"].stringValue
        
        return Planet(name: name, climate: climate, diameter: diamater, gravity: gravity,
                      orbitalPeriod: orbitalPeriod, population: population, terrain: terrain)

    }
    
    private func generateSpeciesModel(json: JSON) -> Species {
        let name = json["name"].stringValue
        let averageHeight = json["average_height"].stringValue
        let classification = json["classification"].stringValue
        // let homeworld = json["homeworld"].stringValue
        let language = json["language"].stringValue
        var skinColours = [String]()
        if let sc = json["skin_colors"].arrayObject as? [String] {
            skinColours = sc
        }
        var hairColours = [String]()
        if let hc = json["hair_colors"].arrayObject as? [String] {
            hairColours = hc
        }
        
        return Species(name: name, averageHeight: averageHeight, classification: classification,
                       language: language, skinColours: skinColours, hairColours: hairColours)
    }
    
    private func generateVehicleModel(json: JSON) -> Vehicle {
        let name = json["name"].stringValue
        let type = json["type"].stringValue
        let cargoCapacity = json["cargo_capacity"].stringValue
        let crew = json["crew"].stringValue
        let cost = json["cost"].stringValue
        let length = json["length"].stringValue
        let manufacturer = json["manufacturer"].stringValue
        let passengers = json["passengers"].stringValue
        
        return Vehicle(name: name, type: type, cargoCapacity: cargoCapacity, crew: crew, cost: cost,
                       length: length, manufacturer: manufacturer, passengers: passengers)
    }
    
}
