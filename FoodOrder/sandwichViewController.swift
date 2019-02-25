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
    
    var sandwiches: [Items] = [
        Items(item: "egg", price: 1.25),
        Items(item: "cheese", price: 1.00),
        Items(item: "bread", price: 1.50)
    ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let optionsViewController: OptionsViewController = segue.destination as? OptionsViewController{
            optionsViewController.totalOrder += sandwichTotal
        
        
        let buttons: [UIButton?] = [
            eggButton,
            cheeseButton,
            breadButton
        ]
        for button in buttons {
            if button?.title(for: .normal) == "✓"{
                optionsViewController.addedItems.updateValue(sandwiches[button?.tag ?? 0].price, forKey: sandwiches[button?.tag ?? 0].item)
            }
        }
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
        if buttonTag == 0 && eggButton.title(for: .normal) == "✓"{
            sandwichTotal += sandwiches[0].price
            
        }else if buttonTag == 1 && cheeseButton.title(for: .normal) == "✓"{
            sandwichTotal += sandwiches[1].price
        }else if buttonTag == 2 && breadButton.title(for: .normal) == "✓"{
            sandwichTotal += sandwiches[2].price
        }
        totalSandwichLabel.text = String(sandwichTotal)
    
    }
    
    func cancelItem(){
        if sandwichTotal != 0 {
        if buttonTag == 0 && eggButton.title(for: .normal) == "Select"{
            sandwichTotal -= sandwiches[0].price
            
        }else if buttonTag == 1 && cheeseButton.title(for: .normal) == "Select"{
            sandwichTotal -= sandwiches[1].price
        }else if buttonTag == 2 && breadButton.title(for: .normal) == "Select"{
            sandwichTotal -= sandwiches[2].price
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
