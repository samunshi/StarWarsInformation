//
//  TableViewController.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-04.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import Foundation
import UIKit

public class TableViewController : UITableViewController {
    
    let tableViewEntryGenerationClient: TableViewEntryGenerationClient = TableViewEntryGenerationClient()
    let specificEntryGenerationClient: SpecificEntryGenerationClient = SpecificEntryGenerationClient()
    
    let allRows: [TableViewRowEntry] = Variables.dataArray
    
    @IBAction func unwindToTableView(segue: UIStoryboardSegue) {}
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Variables.tableType.rawValue
        print("Accessing variables array size: \(Variables.dataArray.count)")
    }
    
    // Table View delegate methods
    override public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allRows.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as? InformationTableViewCell else {
            fatalError("Cell isn't the right type")
        }
        cell.textLabel?.text = allRows[indexPath.row].getName()
        cell.customURL = allRows[indexPath.row].getUniqueInfoURL()
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // get the cell, get the name, make the request and perform the segue
        let selectedTableViewEntry = allRows[indexPath.row]
        print("Selected entry: \(selectedTableViewEntry.getName())")
        let url = selectedTableViewEntry.getUniqueInfoURL()
        
        switch selectedTableViewEntry.type {
        case CellType.character:
            specificEntryGenerationClient.getCharacterEntryInformation(url: url) { (character) in
                print ("Got parsed character and its name is \(character.name)")
                Variables.character = character
                self.performSegue(withIdentifier: "showInfoView", sender: nil)
            }
            break
        case CellType.planet:
            specificEntryGenerationClient.getPlanetEntryInformation(url: url) { (planet) in
                print ("Got parsed planet and its name is \(planet.name)")
                Variables.planet = planet
                self.performSegue(withIdentifier: "showInfoView", sender: nil)

            }
            break
        case CellType.species:
            specificEntryGenerationClient.getSpeciesEntryInformation(url: url) { (species) in
                print ("Got parsed species and its name is \(species.name)")
                Variables.species = species
                self.performSegue(withIdentifier: "showInfoView", sender: nil)

            }
            break
        case CellType.vehicle:
            specificEntryGenerationClient.getVehiclesEntryInformation(url: url) { (vehicle) in
                print("Got parsed vehicle and its name is \(vehicle.name)")
                Variables.vehicle = vehicle
                self.performSegue(withIdentifier: "showInfoView", sender: nil)
            }
            break
        }
    }
    
}
