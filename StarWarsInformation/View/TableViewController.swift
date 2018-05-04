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
        // Make the request here
        tableViewEntryGenerationClient.generateTableViewEntries(type: Variables.tableType)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Variables.tableType.rawValue
    }
    
    // Table View delegate methods
    override public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        //return tableViewEntryGenerationClient.getTableViewEntries()
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell() // again, temp implementation
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle specific selections here...
        // get the cell, get the name, make the request and perform the segue
    }
    
}
