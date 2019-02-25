//
//  drinksViewController.swift
//  FoodOrder
//
//  Created by Chinonso Obidike on 2/24/19.
//  Copyright © 2019 Chinonso Obidike. All rights reserved.
//

import UIKit

class drinksViewController: UIViewController {

    @IBOutlet weak var totalDrinksLabel: UILabel!
    @IBOutlet weak var cofeeButton: UIButton!
    @IBOutlet weak var teaButton: UIButton!
    var buttonTag: Int = 0

    var drinks: [Items] = [
       Items(item: "coffe", price: 2.20),
       Items(item: "tea", price: 2.20)
    ]
    
    
    var drinksTotal: Double = 0.0
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let optionsViewController: OptionsViewController = segue.destination as? OptionsViewController{
            optionsViewController.totalOrder += drinksTotal
        
        let buttons: [UIButton?] = [
            cofeeButton,
            teaButton
        ]
        for button in buttons {
            if button?.title(for: .normal) == "✓"{
                optionsViewController.addedItems.updateValue(drinks[button?.tag ?? 0].price, forKey: drinks[button?.tag ?? 0].item)
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
        if buttonTag == 0 && cofeeButton.title(for: .normal) == "✓"{
           drinksTotal +=  drinks[0].price
           
        }else if buttonTag == 1 && teaButton.title(for: .normal) == "✓"{
            drinksTotal += drinks[1].price
        }
        totalDrinksLabel.text = String(drinksTotal)
    }
    
    func cancelItem(){
        if drinksTotal != 0 {
        if buttonTag == 0 && cofeeButton.title(for: .normal) == "Select"{
            drinksTotal -= drinks[0].price
            
        }else if buttonTag == 1 && teaButton.title(for: .normal) == "Select"{
            drinksTotal -= drinks[1].price
        }
        totalDrinksLabel.text = String(drinksTotal)
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
