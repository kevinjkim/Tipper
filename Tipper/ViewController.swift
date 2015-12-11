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
    @IBOutlet weak var twoPersonLabel: UILabel!
    @IBOutlet weak var threePersonLabel: UILabel!
    @IBOutlet weak var fourPersonLabel: UILabel!
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    var tipAmount: Float = 0
    var billAmount: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.billField.becomeFirstResponder()
        totalLabel.adjustsFontSizeToFitWidth = true
        twoPersonLabel.adjustsFontSizeToFitWidth = true
        threePersonLabel.adjustsFontSizeToFitWidth = true
        fourPersonLabel.adjustsFontSizeToFitWidth = true
    }
    
    override func viewWillAppear(animated: Bool) {
        
        // locale functionality
        if let symbol = NSLocale.currentLocale().objectForKey(NSLocaleCurrencySymbol) {
            billField.attributedPlaceholder = NSAttributedString(string: "\(symbol)", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        }
        
        // tip percentage label functionality
        tipAmount = defaults.floatForKey("tipAmount")
        let tipPercent = Int(tipAmount * 100)
        tipPercentLabel.text = "+ \(tipPercent)%"
        
        // time functionality
        if let previousTime = defaults.objectForKey("currentTime") {
            let timeDiff = NSDate().timeIntervalSinceDate(previousTime as! NSDate)
            let previousBillAmount = defaults.doubleForKey("billAmount")
            
            // 10 min = 600 sec
            if (timeDiff <= 600 && previousBillAmount != 0.0) {
                billField.text = "\(previousBillAmount)"
                billAmount = previousBillAmount
            } else {
                billField.text = ""
            }
            
            updateUI()
        }

    }
    
    override func viewWillDisappear(animated: Bool) {
        defaults.setObject(NSDate(), forKey: "currentTime")
        defaults.setDouble((billField.text! as NSString).doubleValue, forKey: "billAmount")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        if let bill = billField.text {
            billAmount = (bill as NSString).doubleValue
        }
        updateUI()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func updateUI() {
        if (billAmount == 0) {
            billField.text = ""
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.topView.frame = CGRect(origin: self.view.frame.origin, size: self.view.frame.size)
                self.billField.frame.origin.y = CGFloat(180)
            })
        } else {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.topView.frame = CGRect(x: 0, y: 64, width: self.view.frame.width, height: 120)
                self.billField.frame.origin.y = CGFloat(20)
            })
        }
        
        let tip: Double = billAmount * Double(tipAmount)
        let total: Double = billAmount + tip
        let twoTotal: Double = total/2
        let threeTotal: Double = total/3
        let fourTotal: Double = total/4
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
        twoPersonLabel.text = formatter.stringFromNumber(twoTotal)
        threePersonLabel.text = formatter.stringFromNumber(threeTotal)
        fourPersonLabel.text = formatter.stringFromNumber(fourTotal)
    }

}

