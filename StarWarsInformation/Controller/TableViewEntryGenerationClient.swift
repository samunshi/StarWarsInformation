//
//  TableViewEntryGenerationClient.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-04.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import Foundation
import SwiftyJSON

public class TableViewEntryGenerationClient {

    var tableViewEntries: [TableViewRowEntry] = Array()
    var nextURL: String!
    
    let infoClient: InformationClient = InformationClient()
    
    public func generateTableViewEntries(type: CellType) {
        // make initial request
        initialRequestHandler(type: type)
    }
    
    private func initialRequestHandler(type: CellType) {
        infoClient.getInitialScreenPopulationData(type: type) { json in
            self.nextURL = json["next"].stringValue
            // Do parsing here
            if let information = json["results"].array {
                for info in information {
                    let tableViewEntry = TableViewRowEntry(type: type, name: info["name"].stringValue,
                                                           uniqueInfoURL: info["url"].stringValue)
                    self.tableViewEntries.append(tableViewEntry)
                }
            }
            print ("Table view entry array size is \(self.tableViewEntries.count)")
            print("Next URL is: \(self.nextURL)")
            self.subsequentRequestHandler(type: type)
        }
    }
    
    private func subsequentRequestHandler(type: CellType) {
        infoClient.getSubsequentPageInformation(requestURL: nextURL) { json in
            if let nextURL = json["next"].string {
                self.nextURL = nextURL
                // Do parsing here
                if let information = json["results"].array {
                    for info in information {
                        let tableViewEntry = TableViewRowEntry(type: type, name: info["name"].stringValue,
                                                               uniqueInfoURL: info["url"].stringValue)
                        self.tableViewEntries.append(tableViewEntry)
                    }
                }
                print ("Table view entry array size is \(self.tableViewEntries.count)")
                print("Next URL is: \(self.nextURL)")
                self.subsequentRequestHandler(type: type)
            } else {
                self.nextURL = nil
                if let information = json["results"].array {
                    for info in information {
                        let tableViewEntry = TableViewRowEntry(type: type, name: info["name"].stringValue,
                                                               uniqueInfoURL: info["url"].stringValue)
                        self.tableViewEntries.append(tableViewEntry)
                    }
                }
                print ("Table view entry array size is \(self.tableViewEntries.count)")
                print("Next URL is: \(self.nextURL)")
                return
            }
        }
        print ("Within the subsequent request handler method, the array count is: \(tableViewEntries.count)")
    }
    
    public func getTableViewEntries() -> [TableViewRowEntry] {
        return self.tableViewEntries
    }
    
    public func getTableViewEntriesCount() -> Int {
        return tableViewEntries.count
    }
    
    public func getParticularTableViewEntry(index: Int) -> TableViewRowEntry {
        return tableViewEntries[index]
    }
    
}
