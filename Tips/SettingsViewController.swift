//
//  SettingsViewController.swift
//  Tips
//
//  Created by Peter Doan on 22/04/2015.
//  Copyright (c) 2015 Peter Doan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate {
    
    var tipPercentages = NSUserDefaults.standardUserDefaults().mutableArrayValueForKey("tipPercentages");
    var tipDefaultIndex = NSUserDefaults.standardUserDefaults().integerForKey("tipDefaultIndex");
    @IBOutlet weak var defaultTipPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        defaultTipPicker.selectRow(tipDefaultIndex, inComponent: 0, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func doneSetting(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tipPercentages.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
        return "\(tipPercentages[row])%"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(row, forKey: "tipDefaultIndex")
        defaults.synchronize()
        
    }
    
}
