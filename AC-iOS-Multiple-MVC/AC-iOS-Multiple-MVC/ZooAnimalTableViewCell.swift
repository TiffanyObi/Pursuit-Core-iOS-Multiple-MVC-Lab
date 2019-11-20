//
//  ZooAnimalTableViewCell.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tiffany Obi on 11/18/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class ZooAnimalTableViewCell: UITableViewCell {


   @IBOutlet weak var animalNameLabel: UILabel!
   @IBOutlet weak var animalClass: UILabel!
    @IBOutlet weak var animalOrigin: UILabel!
   @IBOutlet weak var animalImage: UIImageView!

    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
    func configureCell(for zooAnimal: ZooAnimal){
        animalNameLabel.text = zooAnimal.name
        animalClass.text = zooAnimal.classification
       
        
        animalOrigin.text = zooAnimal.origin
        animalImage.image = UIImage(named: "\(zooAnimal.imageNumber)")
        
    }
    
    
}
