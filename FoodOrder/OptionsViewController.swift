//
//  OptionsViewController.swift
//  FoodOrder
//
//  Created by Chinonso Obidike on 2/23/19.
//  Copyright © 2019 Chinonso Obidike. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {
    
    //MARK:- Outlets and variables
    var addedItems: [String: Double] = [:]
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var totalPricesLabel: UILabel!
    
    var totalOrder: Double = 0.0
    
    
    //MARK:- View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.isEnabled = false  //disable submit button until there is an order
        
    }
    
    
    //MARK:- Enable submit button once there is an order
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if totalOrder > 0{
            submitButton.isEnabled = true
        }
        totalPricesLabel.text = String(totalOrder)
        print(addedItems)
    
    }
    
    //MARK:- Transfer data to the table view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let navViewcontroller: UINavigationController = segue.destination as? UINavigationController {
        if let totalsTableViewController: totalTableViewController = navViewcontroller.viewControllers.first as? totalTableViewController {
            for (item, price) in addedItems {
                totalsTableViewController.itemsCheckOut.append(Items(item: item, price: price))
            }
        }
        }
    }
  
    
    //MARK:-
    @IBAction func unwindToOptions(unwindSegue: UIStoryboardSegue) {
        
        
    }

    
    @IBAction func submitButtonPressedn(_ sender: UIButton) {
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
