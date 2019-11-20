//
//  CustomCellViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tiffany Obi on 11/19/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class CustomCellViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var animals = [ZooAnimal]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    
    func loadData(){
        animals = ZooAnimal.zooAnimals
    }
   

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let customVC = segue.destination as? DetailViewController,
            
            let indexPath = tableView.indexPathForSelectedRow else{
                fatalError("unable to find VC")
        }
        
        let animal = animals[indexPath.row]
        
        customVC.animal = animal
        
    }
    
  
}
extension CustomCellViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: "customAnimalCell", for: indexPath) as? ZooAnimalTableViewCell else {
            fatalError("failed to dequeue ZooAnimalTableViewCell")
        }
        
        // get the current object (animal) at the indexPath
        
        let animal = animals[indexPath.row]
        
        //configure the cell
        customCell.configureCell(for: animal)
        return customCell
    }
}
extension CustomCellViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
