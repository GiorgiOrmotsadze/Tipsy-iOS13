//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var splitValue = 2
    var tipPercentage = 0.0
    var amountPerPerson = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        if sender == zeroPctButton {
            tipPercentage = 0.0
            print(tipPercentage)
        } else if sender == tenPctButton {
            tipPercentage = 0.1
            print(tipPercentage)
        } else if sender == twentyPctButton {
            tipPercentage = 0.2
            print(tipPercentage)
        }
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitValue = Int(sender.value)
        splitNumberLabel.text = "\(splitValue)"
        print(splitValue)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let billText = billTextField.text, let bill = Double(billText) else {
            print("Invalid bill amount")
            return
            
        }
        
        let totalBill = bill + (bill * tipPercentage)
        amountPerPerson = "\(totalBill / Double(splitValue))"
        print(totalBill)
        print(amountPerPerson)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as!
        ResultsViewController
        destinationVC.result = amountPerPerson
        destinationVC.tip = tipPercentage
        destinationVC.split = splitValue
    }
    
}
