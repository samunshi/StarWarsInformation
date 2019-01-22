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
        label.font = UIFont.init(name: "Starjedi", size: 17)
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
        backgroundColor = UIColor.init(red: 1.0, green: 204/255, blue: 102/255, alpha: 1.0)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageView.heightAnchor.constraint(equalToConstant: 75),
            imageView.widthAnchor.constraint(equalToConstant: 75),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: -8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
            
            ])
    }
    
    // Have these take in some protocol/model
    func bindCell(model: MainMenuInformationModel) {
        titleLabel.text = model.title
        imageView.image = UIImage(named: model.image)
    }
}
