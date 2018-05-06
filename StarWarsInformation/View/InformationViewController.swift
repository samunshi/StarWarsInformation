//
//  InformationViewController.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-05.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import Foundation
import UIKit

public class InformationViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    let infoView: InformationView = InformationView()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        let type: CellType = Variables.tableType
        switch type {
        case .character:
            titleLabel.text = Variables.character.name
            generateCharacterText()
            break
        case .planet:
            titleLabel.text = Variables.planet.name
            generatePlanetText()
            break
        case .species:
            titleLabel.text = Variables.species.name
            generateSpeciesText()
            break
        case .vehicle:
            titleLabel.text = Variables.vehicle.name
            generateVehicleText()
            break
        }
    }
    
    private func generateCharacterText() {
        print (infoView.generateCharacterText())
        textView.text = infoView.generateCharacterText()
    }
    
    private func generatePlanetText() {
        print (infoView.generatePlanetText())
        textView.text = infoView.generatePlanetText()
    }
    
    private func generateSpeciesText() {
        print (infoView.generateSpeciesText())
        textView.text = infoView.generateSpeciesText()
    }
    
    private func generateVehicleText() {
        print (infoView.generateVehiclesText())
        textView.text = infoView.generateVehiclesText()
    }
    
}