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
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Variables.tableType.rawValue
        tableViewEntryGenerationClient.generateTableViewEntries(type: Variables.tableType)
        
    }
    
    // Table View delegate methods
    override public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return tableViewEntryGenerationClient.getTableViewEntriesCount()
        return 10
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        tableViewEntryGenerationClient.generateTableViewEntries(type: Variables.tableType) {
//            print ("Data in array is: \(tableViewEntryGenerationClient.getTableViewEntriesCount())")
//          //  tableView.reloadData()
//
//        }
        let allRows: [TableViewRowEntry] = tableViewEntryGenerationClient.getTableViewEntries()
        for row in allRows {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as? InformationTableViewCell else {
                fatalError("Cell isn't the right type")
            }
            cell.textLabel?.text = row.getName()
            cell.customURL = row.getUniqueInfoURL()
            return cell
        }
        return UITableViewCell() // should not reach this point
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle specific selections here...
        // get the cell, get the name, make the request and perform the segue
    }
    
}
