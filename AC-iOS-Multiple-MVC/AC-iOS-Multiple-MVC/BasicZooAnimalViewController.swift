//
//  ViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tom Seymour on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class BasicZooAnimalViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var zooAnimalS = [ZooAnimal](){
        
        didSet {
            
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       loadData()
        
        
        tableView.dataSource = self
    }
    
    func loadData(){
    zooAnimalS = ZooAnimal.zooAnimals
    }
    
    

    
}


extension BasicZooAnimalViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return zooAnimalS.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let zooCell = tableView.dequeueReusableCell(withIdentifier: "zooAnimalCell", for: indexPath)
        
        
        let animal = zooAnimalS[indexPath.row]
    
        
        // configure cell to be a subtible cell. 
        zooCell.imageView?.image = UIImage(named: animal.imageNumber.description)
        zooCell.textLabel?.text = animal.name
        zooCell.detailTextLabel?.text = animal.origin
    
        return zooCell
    }
    
    
}
