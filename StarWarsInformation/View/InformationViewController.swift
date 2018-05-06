//
//  InformationViewController.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2018-05-05.
//  Copyright © 2018 Satwik Munshi. All rights reserved.
//

import Foundation
import UIKit

public class InformationViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setTitleLabelText()
    }
    
    private func setTitleLabelText() {
        let type: CellType = Variables.tableType
        switch type {
        case .character:
            titleLabel.text = Variables.character.name
        case .planet:
            titleLabel.text = Variables.planet.name
        case .species:
            titleLabel.text = Variables.species.name
        case .vehicle:
            titleLabel.text = Variables.vehicle.name
        }
    }
    
}
