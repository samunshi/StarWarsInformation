//
//  MainMenuViewController.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-02.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
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
        label.font = UIFont.init(name: "Starjedi", size: 35)
        label.textColor = UIColor.init(red: 1.0, green: 204/255, blue: 102/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome! Please select your option:"
        label.font = UIFont.init(name: "Starjedi", size: 14)
        label.textColor = UIColor.init(red: 1.0, green: 204/255, blue: 102/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)    }
    
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
            optionsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            
            ])
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
        let sv = UIViewController.displaySpinner(onView: self.view)
        if (cellTypeBeingPassed != Variables.tableType) {
            Variables.tableType = cellTypeBeingPassed
            tableViewEntryGenerationClient.generateTableViewEntries(type: Variables.tableType) { (dataArray) in
                print("\(Variables.tableType.rawValue) button tapped!")
                print ("MMVC: \(dataArray.count)")
                Variables.dataArray = dataArray
                UIViewController.removeSpinner(spinner: sv)
                self.performSegue(withIdentifier: "tableViewSegue", sender: nil)
            }
        } else {
            UIViewController.removeSpinner(spinner: sv)
            self.performSegue(withIdentifier: "tableViewSegue", sender: nil)
        }
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {}
    
}

extension MainMenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainMenuInformationCell", for: indexPath) as? MainMenuInformationCell else { fatalError("Wrong type") }
        print("the model is \(mainMenuModels[indexPath.row])")
        cell.bindCell(model: mainMenuModels[indexPath.row])
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell selected, request needs to be performed")
        print("the model selected is \(mainMenuModels[indexPath.row].title)")
        switch mainMenuModels[indexPath.row].title {
        case CellType.planet.rawValue:
            cellTypeBeingPassed = .planet
            performInformationRequest()
        case CellType.vehicle.rawValue.lowercased(): // bug in font causes this
            cellTypeBeingPassed = .vehicle
            performInformationRequest()
        case CellType.species.rawValue:
            cellTypeBeingPassed = .species
            performInformationRequest()
        case CellType.character.rawValue:
            cellTypeBeingPassed = .character
            performInformationRequest()
        default:
            print("Unknown!")
        }
        
    }
}

extension MainMenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(mainMenuModels)
        return mainMenuModels.count
    }
}

extension MainMenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
}
