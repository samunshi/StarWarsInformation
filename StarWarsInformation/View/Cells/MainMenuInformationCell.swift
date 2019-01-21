//
//  MainMenuInformationCell.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2019-01-20.
//  Copyright © 2019 Satwik Munshi. All rights reserved.
//

import Foundation
import UIKit

class MainMenuInformationCell: UICollectionViewCell {
    
    // MARK: Properties
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "Starjedi", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        backgroundColor = UIColor.white // this is temp to see the cells
        
        addSubview(titleLabel)
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: -8),
            //titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
            
            ])
    }
    
    // Have these take in some protocol/model
    func bindCell(model: MainMenuInformationModel) {
        titleLabel.text = model.title
        imageView.image = UIImage(named: model.image)
    }
}
