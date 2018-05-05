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
    
    // Local variables
    var cellTypeBeingPassed: CellType!
    
    // Controller layer
    let infoClient : InformationClient = InformationClient()
    let tableViewEntryGenerationClient : TableViewEntryGenerationClient = TableViewEntryGenerationClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Main Menu"
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
        // Need to make API request here so that table view has all the data it needs
        Variables.tableType = CellType.vehicle
        tableViewEntryGenerationClient.generateTableViewEntries(type: Variables.tableType) { (dataArray) in
            print("Vehicle Button Tapped!")
            print ("MMVC: \(dataArray.count)")
            Variables.dataArray = dataArray
            self.performSegue(withIdentifier: "tableViewSegue", sender: nil)
        }
    }
    
    @objc
    func handlePlanetButtonTapped() {
        
        Variables.tableType = CellType.planet
        tableViewEntryGenerationClient.generateTableViewEntries(type: Variables.tableType) { (dataArray) in
            print("Planet Button Tapped!")
            print ("MMVC: \(dataArray.count)")
            Variables.dataArray = dataArray
            self.performSegue(withIdentifier: "tableViewSegue", sender: nil)
        }
        
    }
    
    @objc
    func handleSpeciesButtonTapped() {
        
        Variables.tableType = CellType.species
        tableViewEntryGenerationClient.generateTableViewEntries(type: Variables.tableType) { (dataArray) in
            print("Species Button Tapped!")
            print ("MMVC: \(dataArray.count)")
            Variables.dataArray = dataArray
            self.performSegue(withIdentifier: "tableViewSegue", sender: nil)
        }
    }
    
    @objc
    func handleCharacterButtonTapped() {
        
        Variables.tableType = CellType.character
        tableViewEntryGenerationClient.generateTableViewEntries(type: Variables.tableType) { (dataArray) in
            print("Character Button Tapped!")
            print ("MMVC: \(dataArray.count)")
            Variables.dataArray = dataArray
            self.performSegue(withIdentifier: "tableViewSegue", sender: nil)
        }
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {}
    
}

