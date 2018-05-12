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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var speciesIndicator: UIActivityIndicatorView!
    @IBOutlet weak var characterIndicator: UIActivityIndicatorView!
    @IBOutlet weak var vehicleIndicator: UIActivityIndicatorView!
    
    
    // Local variables
    var cellTypeBeingPassed: CellType!
    
    // Controller layer
    let tableViewEntryGenerationClient : TableViewEntryGenerationClient = TableViewEntryGenerationClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Main Menu"
        
        initializeImageTouchEvents()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        activityIndicator.stopAnimating()
        showAllButtons()
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
        vehicleButton.isOpaque = true
        vehicleIndicator.startAnimating()
        
        Variables.tableType = CellType.vehicle
        performInformationRequest()
    }
    
    @objc
    func handlePlanetButtonTapped() {
        planetButton.isHidden = true
        activityIndicator.startAnimating()
        
        Variables.tableType = CellType.planet
        performInformationRequest()
        
    }
    
    @objc
    func handleSpeciesButtonTapped() {
        speciesButton.isOpaque = true
        speciesIndicator.startAnimating()
        
        Variables.tableType = CellType.species
        performInformationRequest()
    }
    
    @objc
    func handleCharacterButtonTapped() {
        characterButton.isOpaque = true
        characterIndicator.startAnimating()
    
        Variables.tableType = CellType.character
        performInformationRequest()
    }
    
    func performInformationRequest() {
        tableViewEntryGenerationClient.generateTableViewEntries(type: Variables.tableType) { (dataArray) in
            print("\(Variables.tableType.rawValue) button tapped!")
            print ("MMVC: \(dataArray.count)")
            Variables.dataArray = dataArray
            self.performSegue(withIdentifier: "tableViewSegue", sender: nil)
        }
    }
    
    func showAllButtons() {
        planetButton.isHidden = false
        speciesButton.isHidden = false
        characterButton.isHidden = false
        vehicleButton.isHidden = false
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {}
    
}

