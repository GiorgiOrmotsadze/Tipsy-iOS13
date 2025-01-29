//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Giorgi Ormotsadze on 27.01.25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var tip = 0.0
    var split = 2
    var result = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let totalNumber = Double(result)
        let roundedTotalNumber = ceil(totalNumber! * 100) / 100
        totalLabel.text = "\(roundedTotalNumber)"
        settingsLabel.text = "Split between \(split) people, with \(tip * 100)% tip."
    }
    
    
    
    @IBOutlet weak var recalculatePressed: UIButton!
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)    }
}
