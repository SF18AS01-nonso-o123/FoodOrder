//
//  pizzaViewController.swift
//  FoodOrder
//
//  Created by Chinonso Obidike on 2/24/19.
//  Copyright © 2019 Chinonso Obidike. All rights reserved.
//

import UIKit

class pizzaViewController: UIViewController {
    var buttonTag: Int = 0
    @IBOutlet weak var pizzaTotalLabel: UILabel!
    @IBOutlet weak var pepperoniButton: UIButton!
    @IBOutlet weak var cheesePizzButton: UIButton!
    
    var pizzaTotal: Double = 0.0
    var pizza: [String: Double] = [
        "pepperoni": 3.50,
        "cheesePizz": 3.00
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
            removeItem()
        }

    }
    
    func addSubTotal(){
        guard let peppPrice: Double = pizza["pepperoni"],
            let cheesePrice: Double = pizza["cheesePizz"]
            else {
                return
        }
        if buttonTag == 6 && pepperoniButton.title(for: .normal) == "✓"{
            pizzaTotal += peppPrice
            
        }else if buttonTag == 7 && cheesePizzButton.title(for: .normal) == "✓"{
            pizzaTotal += cheesePrice
        }
        
        pizzaTotalLabel.text = String(pizzaTotal)
        
    }
    
    func removeItem(){
        guard let peppPrice: Double = pizza["pepperoni"],
            let cheesePrice: Double = pizza["cheesePizz"]
            else {
                return
        }
        if buttonTag == 6 && pepperoniButton.title(for: .normal) == "Select"{
            pizzaTotal -= peppPrice
            
        }else if buttonTag == 7 && cheesePizzButton.title(for: .normal) == "Select"{
            pizzaTotal -= cheesePrice
        }
        
        pizzaTotalLabel.text = String(pizzaTotal)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let optionsViewController: OptionsViewController = segue.destination as? OptionsViewController{
            optionsViewController.totalOrder += pizzaTotal
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
