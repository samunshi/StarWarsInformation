//
//  Variables.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-04.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import Foundation

struct Variables {
    static var tableType: CellType!
    static var dataArray = [TableViewRowEntry]()
    static var movieArray = [Movie]()
    
    // Current individual info models
    static var character: Character!
    static var species: Species!
    static var planet: Planet!
    static var vehicle: Vehicle!
    
    // Define all movie names so you use the same ones
    static let aNewHope = "A New Hope"
    static let empireStrikesBack = "The Empire Strikes Back"
    static let returnOfTheJedi = "Return of the Jedi"
    static let phantomMenace = "The Phantom Menace"
    static let attackOfTheClones = "Attack of the Clones"
    static let theForceAwakens = "The Force Awakens"
    static let theLastJedi = "Star Wars: Episode VIII The Last Jedi" // not supported by API yet
    static let rogueOne = "Rogue One: A Star Wars Story" // not supported by API yet
    static let revengeOfTheSith = "Revenge of the Sith"
    
    // Movie Name to imdbUrl Dict
    static let nameToInfoUrl: [String: String] = [aNewHope: "https://m.imdb.com/title/tt0076759/?ref_=nv_sr_5",
                                                  empireStrikesBack: "https://m.imdb.com/title/tt0080684/?ref_=fn_al_tt_1",
                                                  returnOfTheJedi: "https://m.imdb.com/title/tt0086190/?ref=m_nv_sr_2",
                                                  phantomMenace: "https://m.imdb.com/title/tt0120915/?ref=m_nv_sr_1",
                                                  attackOfTheClones: "https://m.imdb.com/title/tt0121765/?ref=m_nv_sr_1",
                                                  theForceAwakens: "https://m.imdb.com/title/tt2488496/?ref=m_nv_sr_1",
                                                  theLastJedi: "https://m.imdb.com/title/tt2527336/?ref_=fn_al_tt_0",
                                                  rogueOne: "https://m.imdb.com/title/tt3748528/?ref=m_nv_sr_2",
                                                  revengeOfTheSith: "https://m.imdb.com/title/tt0121766/?ref=m_nv_sr_1"]
    
    // Movie Name to image name Dict
    static let nameToImageName: [String: String] = [aNewHope: "a-new-hope.jpg",
                                                    empireStrikesBack: "empire-strikes-back.jpg",
                                                    returnOfTheJedi: "return-of-the-jedi.jpg",
                                                    phantomMenace: "phantom-menace.jpg",
                                                    attackOfTheClones: "attack-of-the-clones.jpg",
                                                    theForceAwakens: "the-force-awakens.jpg",
                                                    theLastJedi: "the-last-jedi.jpg",
                                                    rogueOne: "rogue-one.jpeg",
                                                    revengeOfTheSith: "revenge-of-the-sith.jpeg"]
    
}
