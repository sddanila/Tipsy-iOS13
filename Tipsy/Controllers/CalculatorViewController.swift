//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tip = 0.1
    var splitNumber = 2
    var splitAmount = 0.00

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: UIButton) {
        self.view.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        tip = Double(String(sender.currentTitle!.dropLast()))! / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        self.view.endEditing(true)
        let stepperValue = sender.value
        splitNumber = Int(stepperValue)
        splitNumberLabel.text = String(splitNumber)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let total = Double(billTextField.text!) ?? 0.00
        
        splitAmount = total * (1 + tip) / Double(splitNumber)
        
        performSegue(withIdentifier: "ResultsViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultsViewController
        destinationVC.numberOfPeople = String(splitNumber)
        destinationVC.percentage = String("\(tip * 100)%")
        destinationVC.splitAmount = String(format: "%.2f", splitAmount)
    }
    
}

