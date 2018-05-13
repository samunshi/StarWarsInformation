//
//  InformationView.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-05.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import Foundation
import UIKit

public class InformationView {
    
    public func generateCharacterText() -> String {
        let character: Character = Variables.character
        let genderTextCapital: String
        let genderText: String

        if (character.gender == "male") {
            genderTextCapital = "His"
            genderText = "his"
        } else {
            genderTextCapital = "Her"
            genderText = "her"
        }
    
        let text: String = "\(character.name) was born in the year \(character.birthYear). \(genderTextCapital) hair colour is \(character.hairColour) and \(genderText) eye colour is \(character.eyeColour)."
        
        return text
    }
    
    public func generateSpeciesText() -> String {
        let species: Species = Variables.species
        
        let text: String = "\(species.name) is a species which is classified as \(species.classification). Its average height is \(species.averageHeight) and its skin colour(s) are \(species.skinColours). Its hair colour(s) are \(species.hairColours). It speaks the language \(species.language)."
        
        return text
        
    }
    public func generatePlanetText() -> String {
        let planet: Planet = Variables.planet
        let text = "\(planet.name) is a planet with a population of \(planet.population). It has a \(planet.climate) climate and an orbital period of \(planet.orbitalPeriod) days. Its diameter is \(planet.diamater) kilometers and its gravitational force is \(planet.gravity). The planet is primarily made up of \(planet.terrain)."
        return text
    }
    
    public func generateVehiclesText() -> String {
        let vehicle: Vehicle = Variables.vehicle
        let text = "\(vehicle.name) is a vehicle of type \(vehicle.type). It is manufactured by \(vehicle.manufacturer) and has a cargo capacity of \(vehicle.cargoCapacity). Its typical crew complement is \(vehicle.crew) and it can carry up to \(vehicle.passengers) passengers. It costs around \(vehicle.cost) and is \(vehicle.length) metres long."
        return text
    }
    
    
}
