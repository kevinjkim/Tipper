//
//  ViewController.swift
//  Tipper
//
//  Created by Kevin Kim on 11/30/15.
//  Copyright © 2015 Kevin Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    var tipAmount: Float = 0
    var lightMode: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        tipAmount = defaults.floatForKey("tipAmount")
        lightMode = defaults.boolForKey("lightMode")
        
        let tipPercent = Int(tipAmount * 100)
        tipPercentLabel.text = "(+\(tipPercent)%)"
        onEditingChanged(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        let symbol = NSLocale.currentLocale().objectForKey(NSLocaleCurrencySymbol)
        
        print(symbol)
        
        let tipPercentages: [Double] = [0.18, 0.2, 0.22]
        let tipPercentage: Double = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount:Double = 0
        
        if let bill = billField.text {
            billAmount = (bill as NSString).doubleValue
        }
        
        let tip: Double = billAmount * Double(tipAmount)
        let total: Double = billAmount + tip
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
        
        //tipLabel.text = String(format: "$%.2f", tip)
        //totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
    }

}

