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
    static let aNewHope = "Star Wars: Episode IV A New Hope"
    static let empireStrikesBack = "Star Wars: Episode V The Empire Strikes Back"
    static let returnOfTheJedi = "Star Wars: Episode VI Return of the Jedi"
    static let phantomMenace = "Star Wars: Episode I The Phantom Menance"
    static let attackOfTheClones = "Star Wars: Episode II Attack of the Clones"
    static let theForceAwakens = "Star Wars: Episode VII The Force Awakens"
    static let theLastJedi = "Star Wars: Episode VIII The Last Jedi"
    static let rogueOne = "Rogue One: A Star Wars Story"
    static let revengeOfTheSith = "Star Wars: Episode III Revenge of the Sith"
    
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
                                                    empireStrikesBack: "attack-of-the-clones.jpg",
                                                    returnOfTheJedi: "empire-strikes-back.jpg",
                                                    phantomMenace: "phantom-menace.jpg",
                                                    attackOfTheClones: "return-of-jedi.jpg",
                                                    theForceAwakens: "revenge-of-the-sith.jpeg",
                                                    theLastJedi: "the-last-jedi.jpg",
                                                    rogueOne: "rogue-one.jpeg",
                                                    revengeOfTheSith: "revenge-of-the-sith.jpeg"]
    
}
