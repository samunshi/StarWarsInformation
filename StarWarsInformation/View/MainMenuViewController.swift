//
//  MainMenuViewController.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-02.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: Properties
    let optionsCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = .init()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.black
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "StarWarsinfo"
        label.font = UIFont.init(name: "Starjedi", size: 25)
        label.textColor = UIColor.yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome! Please select your option:"
        label.font = UIFont.init(name: "Starjedi", size: 14)
        label.textColor = UIColor.yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    var cellTypeBeingPassed: CellType!
    
    var mainMenuModels: [MainMenuInformationModel] = []
    
    // Controller layer
    let tableViewEntryGenerationClient : TableViewEntryGenerationClient = TableViewEntryGenerationClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Main Menu"
        
        self.view.backgroundColor = .black
        
        optionsCollectionView.dataSource = self
        optionsCollectionView.delegate = self
        
        optionsCollectionView.register(MainMenuInformationCell.self, forCellWithReuseIdentifier: "MainMenuInformationCell")
        
        commonInit()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        generateMainMenuModels()
    }
    
    func commonInit() {
        view.addSubview(optionsCollectionView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -5),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            optionsCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            optionsCollectionView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            optionsCollectionView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            optionsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -175),
            
            ])
    }
    
    // MARK: UICollectionView Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(mainMenuModels)
        return mainMenuModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainMenuInformationCell", for: indexPath) as? MainMenuInformationCell else { fatalError("Wrong type") }
        print("the model is \(mainMenuModels[indexPath.row])")
        cell.bindCell(model: mainMenuModels[indexPath.row])
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell selected, request needs to be performed")
        print("the model selected is \(mainMenuModels[indexPath.row].title)")
        switch mainMenuModels[indexPath.row].title {
        case CellType.planet.rawValue:
            Variables.tableType = .planet
            performInformationRequest()
        case CellType.vehicle.rawValue.lowercased(): // bug in font causes this
            Variables.tableType = .vehicle
            performInformationRequest()
        case CellType.species.rawValue:
            Variables.tableType = .species
            performInformationRequest()
        case CellType.character.rawValue:
            Variables.tableType = .character
            performInformationRequest()
        default:
            print("Unknown!")
        }
        
    }
    
    func generateMainMenuModels() {
        let planetsModel = MainMenuInformationModel(title: "Planets", image: "planet")
        let speciesModel = MainMenuInformationModel(title: "Species", image: "chewbacca")
        let vehiclesModel = MainMenuInformationModel(title: "vehicles", image: "falcon")
        let charactersModel = MainMenuInformationModel(title: "Characters", image: "darth_vader")
        mainMenuModels.append(planetsModel)
        mainMenuModels.append(speciesModel)
        mainMenuModels.append(vehiclesModel)
        mainMenuModels.append(charactersModel)
    }
    
    func performInformationRequest() {
        tableViewEntryGenerationClient.generateTableViewEntries(type: Variables.tableType) { (dataArray) in
            print("\(Variables.tableType.rawValue) button tapped!")
            print ("MMVC: \(dataArray.count)")
            Variables.dataArray = dataArray
            self.performSegue(withIdentifier: "tableViewSegue", sender: nil)
        }
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {}
    
}
