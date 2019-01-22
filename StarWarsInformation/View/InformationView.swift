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
        let text: String = """
            Birth Year (if known): \(character.birthYear)
            Gender: \(character.gender)
            Eye Colour: \(character.eyeColour)
            """
        return text
    }
    
    public func generateSpeciesText() -> String {
        let species: Species = Variables.species
    
        let text: String = """
            Classification (if known): \(species.classification)
            Average height (if known): \(species.averageHeight)
            Skin Colour(s): \(species.skinColours)
            Hair Colour(s): \(species.hairColours)
            Languages (if known): \(species.language)
            """
        
        return text
        
    }
    public func generatePlanetText() -> String {
        let planet: Planet = Variables.planet
        let text: String = """
            Population: \(planet.population)
            Climate: \(planet.climate)
            Orbital Period: \(planet.orbitalPeriod)
            Diameter: \(planet.diamater)
            Gravitational force: \(planet.gravity)
        """
    
        return text
    }
    
    public func generateVehiclesText() -> String {
        let vehicle: Vehicle = Variables.vehicle
        let text: String = """
            Type (if known): \(vehicle.type)
            Manufacturer: \(vehicle.manufacturer)
            Cargo Capacity: \(vehicle.cargoCapacity)
            Crew complement: \(vehicle.crew)
            Passengers: \(vehicle.passengers)
            Vehicle Cost: \(vehicle.cost)
            Vehicle Length: \(vehicle.length) m
        """
        return text
    }
    
    
}
