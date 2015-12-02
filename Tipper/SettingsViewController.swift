//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Kevin Kim on 12/2/15.
//  Copyright © 2015 Kevin Kim. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var lightSwitch: UISwitch!
    
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tipSliderMoved(sender: AnyObject) {
        let tipAmount: Float = tipSlider.value
        print(tipAmount)
        defaults.setFloat(tipAmount, forKey: "tipAmount")
        defaults.synchronize()
    }
    
    @IBAction func settingsButtonPushed(sender: AnyObject) {
        let settingsURL = NSURL(string: UIApplicationOpenSettingsURLString)!
        UIApplication.sharedApplication().openURL(settingsURL)
    }
    
    
    @IBAction func lightSwitchChanged(sender: AnyObject) {
        let lightMode: Bool = lightSwitch.on
        defaults.setBool(lightMode, forKey: "lightMode")
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
