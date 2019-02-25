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
    
    var pizza: [Items] = [
        Items(item: "pepperoni", price: 3.50),
        Items(item: "cheese", price: 3.0)
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
        if buttonTag == 6 && pepperoniButton.title(for: .normal) == "✓"{
            pizzaTotal += pizza[0].price
            
        }else if buttonTag == 7 && cheesePizzButton.title(for: .normal) == "✓"{
            pizzaTotal += pizza[1].price
        }
        
        pizzaTotalLabel.text = String(pizzaTotal)
        
    }
    
    func removeItem(){
        if buttonTag == 6 && pepperoniButton.title(for: .normal) == "Select"{
            pizzaTotal -= pizza[0].price
            
        }else if buttonTag == 7 && cheesePizzButton.title(for: .normal) == "Select"{
            pizzaTotal -= pizza[1].price
        }
        
        pizzaTotalLabel.text = String(pizzaTotal)
        
    }

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
