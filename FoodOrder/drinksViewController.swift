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
    /*var item: [String: Double] = [:]
    var drinks: [String: Double] = [
        "coffee": 2.20,
        "tea": 2.20
    ]*/
    var drink: [Items] = [
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
        /*guard let coffeePrice: Double = drinks["coffee"],
            let teaPrice: Double = drinks["tea"]
            else {
                return
        }*/
        if buttonTag == 1 && cofeeButton.title(for: .normal) == "✓"{
           drinksTotal +=  drink[0].price
           
        }else if buttonTag == 2 && teaButton.title(for: .normal) == "✓"{
            drinksTotal += drink[1].price //teaPrice
        }
        totalDrinksLabel.text = String(drinksTotal)
    }
    
    func cancelItem(){
        /*guard let coffeePrice: Double = drinks["coffee"],
            let teaPrice: Double = drinks["tea"]
            else {
                return
        }*/
        if drinksTotal != 0 {
        if buttonTag == 1 && cofeeButton.title(for: .normal) == "Select"{
            drinksTotal -= drink[0].price //coffeePrice
            
        }else if buttonTag == 2 && teaButton.title(for: .normal) == "Select"{
            drinksTotal -= drink[1].price //teaPrice
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
