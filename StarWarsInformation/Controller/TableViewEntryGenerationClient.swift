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

    var tableViewEntries: [TableViewRowEntry]!
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
            print("Next URL is: \(self.nextURL)")
            self.subsequentRequestHandler()
        }
    }
    
    private func subsequentRequestHandler() {
        infoClient.getSubsequentPageInformation(requestURL: nextURL) { json in
            if let nextURL = json["next"].string {
                self.nextURL = nextURL
                // Do parsing here
                print("Next URL is: \(self.nextURL)")
                self.subsequentRequestHandler()
            } else {
                self.nextURL = nil
                return
            }
        }
    }
    
    public func getTableViewEntries() -> Int {
        return tableViewEntries.count
    }
    
}
