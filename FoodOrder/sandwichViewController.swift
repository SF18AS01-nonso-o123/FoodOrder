//
//  sandwichViewController.swift
//  FoodOrder
//
//  Created by Chinonso Obidike on 2/24/19.
//  Copyright © 2019 Chinonso Obidike. All rights reserved.
//

import UIKit

class sandwichViewController: UIViewController {
    @IBOutlet weak var totalSandwichLabel: UILabel!
    @IBOutlet weak var eggButton: UIButton!
    @IBOutlet weak var cheeseButton: UIButton!
    @IBOutlet weak var breadButton: UIButton!
    
    var sandwichTotal: Double = 0.0
    var buttonTag: Int = 0
    
    var sandwiches: [String: Double] = [
        "egg": 1.25,
        "cheese": 1.00,
        "bread": 1.50
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let optionsViewController: OptionsViewController = segue.destination as? OptionsViewController{
            optionsViewController.totalOrder += sandwichTotal
        }
        
    }
    
    @IBAction func selectButtonPressed(_ sender: UIButton) {
        buttonTag = sender.tag
        guard sender.title(for: .normal) != nil else {
            return
        }
        
        if sender.title(for: .normal) == "Select"{
            sender.setTitle("✓", for: .normal)
            addSubTotal()
        }else{
            sender.setTitle("Select", for: .normal)
            cancelItem()
        }
    }
    
    
    func addSubTotal(){
        guard let eggPrice: Double = sandwiches["egg"],
            let cheesePrice: Double = sandwiches["cheese"],
            let breadPrice: Double = sandwiches["bread"]
            else {
                return
        }
        if buttonTag == 3 && eggButton.title(for: .normal) == "✓"{
            sandwichTotal += eggPrice
            
        }else if buttonTag == 4 && cheeseButton.title(for: .normal) == "✓"{
            sandwichTotal += cheesePrice
        }else if buttonTag == 5 && breadButton.title(for: .normal) == "✓"{
            sandwichTotal += breadPrice
        }
        totalSandwichLabel.text = String(sandwichTotal)
    
    }
    
    func cancelItem(){
        guard let eggPrice: Double = sandwiches["egg"],
            let cheesePrice: Double = sandwiches["cheese"],
            let breadPrice: Double = sandwiches["bread"]
            else {
                return
        }
        if sandwichTotal != 0 {
        if buttonTag == 3 && eggButton.title(for: .normal) == "Select"{
            sandwichTotal -= eggPrice
            
        }else if buttonTag == 4 && cheeseButton.title(for: .normal) == "Select"{
            sandwichTotal -= cheesePrice
        }else if buttonTag == 5 && breadButton.title(for: .normal) == "Select"{
            sandwichTotal -= breadPrice
        }
        totalSandwichLabel.text = String(sandwichTotal)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
