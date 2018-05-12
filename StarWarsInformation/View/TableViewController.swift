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
    var filteredRows = [TableViewRowEntry]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBAction func unwindToTableView(segue: UIStoryboardSegue) {}
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Variables.tableType.rawValue
        print("Accessing variables array size: \(Variables.dataArray.count)")
        
        // Initialize search controller stuff
        initSearchController()
    }
    
    func initSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Find \(Variables.tableType.rawValue)"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // MARK-- required search methods
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredRows = allRows.filter({ (entry: TableViewRowEntry) -> Bool in
            return entry.getName().lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    func isSearching() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    // Table View delegate methods
    override public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching() {
            return filteredRows.count
        }
        
        return allRows.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as? InformationTableViewCell else {
            fatalError("Cell isn't the right type")
        }
        let tableViewEntry: TableViewRowEntry
        if isSearching() {
            tableViewEntry = filteredRows[indexPath.row]
        } else {
            tableViewEntry = allRows[indexPath.row]
        }
        
        cell.textLabel?.text = tableViewEntry.getName()
        cell.customURL = tableViewEntry.getUniqueInfoURL()
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // get the cell, get the name, make the request and perform the segue
        let selectedTableViewEntry: TableViewRowEntry
        
        if isSearching() {
            selectedTableViewEntry = filteredRows[indexPath.row]
        } else {
            selectedTableViewEntry = allRows[indexPath.row]
        }
        
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

// MARK -- Used to implement search functionality
extension TableViewController: UISearchResultsUpdating {
    public func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
}


