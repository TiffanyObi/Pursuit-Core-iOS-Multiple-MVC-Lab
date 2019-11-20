//
//  AnimalSectionViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tiffany Obi on 11/19/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class AnimalSectionViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    
    var animalClassifications = [[ZooAnimal]](){
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self // for using heightForRow
        loadData()
    
    }
    
    func loadData(){
        animalClassifications = ZooAnimal.classificationSections()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let detailVC = segue.destination as? DetailViewController,
            
        let indexPath = tableView.indexPathForSelectedRow
        else  {
            fatalError("could not access VC")
            
        }
        
        let animalsClass = animalClassifications[indexPath.section][indexPath.row]
        
        detailVC.animal = animalsClass
    }
    
    
}

extension AnimalSectionViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalClassifications[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: ZooAnimalTableViewCell!
        
        if indexPath.section % 2 == 0 {
            

        guard let sectionCell = tableView.dequeueReusableCell(withIdentifier: "sectionAnimals", for: indexPath) as? ZooAnimalTableViewCell else{
            fatalError("Couldnt identify cell")
        }
           cell = sectionCell
        
        } else {
            
         guard let sectionCellLeft = tableView.dequeueReusableCell(withIdentifier: "sectionAnimalsleft", for: indexPath) as? ZooAnimalTableViewCell else {
            fatalError("couldnt identify cell")
        }
         cell = sectionCellLeft
        }
        
        let animal = animalClassifications[indexPath.section][indexPath.row]
            
        cell.configureCell(for: animal)
        
        return cell
        
    
    }
    //MARK:- methods needed for sections to implement data
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalClassifications[section].first?.classification
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return animalClassifications.count
    }
  
}

    

extension AnimalSectionViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
