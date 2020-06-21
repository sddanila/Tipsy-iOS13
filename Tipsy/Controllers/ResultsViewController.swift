//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Danila Barton-Szabo on 2020-06-20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var numberOfPeople : String = ""
    var percentage : String = ""
    var splitAmount : String = ""

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = splitAmount
        settingsLabel.text = "Split between \(numberOfPeople) people with \(percentage) tip."
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
