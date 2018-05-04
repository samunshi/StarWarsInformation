//
//  MainMenuViewController.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-02.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    // Outlet connections
    @IBOutlet weak var planetButton: UIImageView!
    @IBOutlet weak var speciesButton: UIImageView!
    @IBOutlet weak var characterButton: UIImageView!
    @IBOutlet weak var vehicleButton: UIImageView!
    
    // Controller layer
    let infoClient : InformationClient = InformationClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeImageTouchEvents()
    }
    
    func initializeImageTouchEvents() {
        let planetTap = UITapGestureRecognizer(target: self, action: #selector(MainMenuViewController.handlePlanetButtonTapped))
        planetButton.isUserInteractionEnabled = true
        planetButton.addGestureRecognizer(planetTap)
        
        let speciesTap = UITapGestureRecognizer(target: self, action: #selector(MainMenuViewController.handleSpeciesButtonTapped))
        speciesButton.isUserInteractionEnabled = true
        speciesButton.addGestureRecognizer(speciesTap)
        
        let characterTap = UITapGestureRecognizer(target: self, action: #selector(MainMenuViewController.handleCharacterButtonTapped))
        characterButton.isUserInteractionEnabled = true
        characterButton.addGestureRecognizer(characterTap)
        
        let vehicleTap = UITapGestureRecognizer(target: self, action: #selector(MainMenuViewController.handleVehicleButtonTapped))
        vehicleButton.isUserInteractionEnabled = true
        vehicleButton.addGestureRecognizer(vehicleTap)
        
    }
    
    @objc
    func handleVehicleButtonTapped() {
        print("Vehicle Button Tapped!")
    }
    
    
    @objc
    func handlePlanetButtonTapped() {
        print("Planet Button Tapped!")
    }
    
    @objc
    func handleSpeciesButtonTapped() {
        print("Species Button Tapped!")
    }
    
    @objc
    func handleCharacterButtonTapped() {
        print("Character Button Tapped!")
    }
    
}

