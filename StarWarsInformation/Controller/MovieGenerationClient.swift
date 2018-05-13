//
//  MovieGenerationClient.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-13.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import Foundation
import SwiftyJSON

public class MovieGenerationClient {
    
    let infoClient: InformationApiClient = InformationApiClient()
    let dispatchGroup = DispatchGroup()
    
    // There are multiple urls to hit
    public func generateMovieEntries(urls: [String], completion: @escaping ([Movie]) -> Void) {
        var generatedMovies = [Movie]()
        // For each url, make a request and parse it to movies
        
        urls.forEach { (url) in
            dispatchGroup.enter()
            infoClient.getSpecificInformationAboutEntity(requestURL: url, completion: { (json) in
                let movieEntry = self.generateMovie(json: json)
                generatedMovies.append(movieEntry)
                self.dispatchGroup.leave()
            })
        }
        
        dispatchGroup.notify(queue: .main) {
            print("Movie generation complete with array size \(generatedMovies.count)")
            completion(generatedMovies)
        }
    }
    
    private func generateMovie(json: JSON) -> Movie {
        let title: String = json["title"].stringValue
        let imdbUrl = Variables.nameToInfoUrl[title]
        
        return Movie(name: title, imdbUrl: imdbUrl!)
        
    }
    
}
