//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Kevin Kim on 12/2/15.
//  Copyright © 2015 Kevin Kim. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var settingsButton: UIButton!
    
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tip = defaults.floatForKey("tipAmount")
        tipSlider.value = tip
        percentLabel.text = "\(Int(tip * 100))%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func tipSliderMoved(sender: AnyObject) {
        let tipAmount: Float = tipSlider.value
        defaults.setFloat(tipAmount, forKey: "tipAmount")
        defaults.synchronize()
        
        let tipPercent: Int = Int(tipAmount * 100)
        percentLabel.text = "\(tipPercent)%"
    }
    
    @IBAction func settingsButtonPushed(sender: AnyObject) {
        let settingsURL = NSURL(string: UIApplicationOpenSettingsURLString)!
        UIApplication.sharedApplication().openURL(settingsURL)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
