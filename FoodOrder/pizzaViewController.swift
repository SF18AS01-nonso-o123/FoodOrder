//
//  pizzaViewController.swift
//  FoodOrder
//
//  Created by Chinonso Obidike on 2/24/19.
//  Copyright © 2019 Chinonso Obidike. All rights reserved.
//

import UIKit

class pizzaViewController: UIViewController {
    
    //MARK:- Outlets and variables
    var buttonTag: Int = 0
    @IBOutlet weak var pizzaTotalLabel: UILabel!
    @IBOutlet weak var pepperoniButton: UIButton!
    @IBOutlet weak var cheesePizzButton: UIButton!
 
    var pizzaTotal: Double = 0.0
    
    var pizza: [Items] = [
        Items(item: "pepperoni", price: 3.50),
        Items(item: "cheese", price: 3.0)
    ]

    //MARK:- View did load
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Select button pressed
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
    
    //MARK:- Add sub total
    func addSubTotal(){
        if buttonTag == 6 && pepperoniButton.title(for: .normal) == "✓"{
            pizzaTotal += pizza[0].price
            
        }else if buttonTag == 7 && cheesePizzButton.title(for: .normal) == "✓"{
            pizzaTotal += pizza[1].price
        }
        
        pizzaTotalLabel.text = String(pizzaTotal)
        
    }
    
    //MARK:- Remove canceled item
    func removeItem(){
        if buttonTag == 6 && pepperoniButton.title(for: .normal) == "Select"{
            pizzaTotal -= pizza[0].price
            
        }else if buttonTag == 7 && cheesePizzButton.title(for: .normal) == "Select"{
            pizzaTotal -= pizza[1].price
        }
        
        pizzaTotalLabel.text = String(pizzaTotal)
        
    }

    //MARK:- Prepare for segue; Transmit data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let optionsViewController: OptionsViewController = segue.destination as? OptionsViewController{
            optionsViewController.totalOrder += pizzaTotal
        
        
        let buttons: [UIButton?] = [
            pepperoniButton,
            cheesePizzButton
        ]
        for button in buttons {
            if button?.title(for: .normal) == "✓"{
                optionsViewController.addedItems.updateValue(pizza[button?.tag ?? 0].price, forKey: pizza[button?.tag ?? 0].item)
            }
        }
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
