//
//  ViewController.swift
//  Tips
//
//  Created by Peter Doan on 22/04/2015.
//  Copyright (c) 2015 Peter Doan. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
  @IBOutlet weak var billField: UITextField!
  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var split2Label: UILabel!
  @IBOutlet weak var split3Label: UILabel!
  @IBOutlet weak var split4Label: UILabel!
  @IBOutlet weak var tipControl: UISegmentedControl!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    tipLabel.text = "$0.00"
    totalLabel.text = "$0.00"
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func recalculateTip(){
    var defaults = NSUserDefaults.standardUserDefaults();
    var tipPercentages = defaults.mutableArrayValueForKey("tipPercentages");
    var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex] as! Double;
    
    var billAmount = NSString(string:billField.text).doubleValue
    var tip = billAmount * (tipPercentage/100)
    var total = billAmount + tip
    
    tipLabel.text = String(format: "$%.2f", tip)
    totalLabel.text = String(format: "$%.2f", total)
    split2Label.text = String(format: "$%.2f", total/2)
    split3Label.text = String(format: "$%.2f", total/3)
    split4Label.text = String(format: "$%.2f", total/4)
    
  }
  
  @IBAction func onEditingChanged(sender: AnyObject) {
    recalculateTip()
    
  }
  @IBAction func onTap(sender: AnyObject) {
    view.endEditing(true)
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    println("view will appear")
    
    var defaultTipPercentages = [15, 20, 25] as NSMutableArray;
    
    var defaults = NSUserDefaults.standardUserDefaults();
    var tipPercentages = defaults.mutableArrayValueForKey("tipPercentages");
    var tipDefaultIndex = defaults.integerForKey("tipDefaultIndex");
    
    if (tipPercentages.count == 0) {
      defaults.setObject(defaultTipPercentages, forKey: "tipPercentages")
      defaults.setInteger(1, forKey: "tipDefaultIndex")
      defaults.synchronize()
      
      tipPercentages = defaults.mutableArrayValueForKey("tipPercentages");
      tipDefaultIndex = defaults.integerForKey("tipDefaultIndex");
    }
    
    for var index = 0; index < tipPercentages.count; ++index {
      var temp = tipPercentages[index] as! Double;
      tipControl.setTitle(String(format: "%.f%%", temp), forSegmentAtIndex: index)
    }
    tipControl.selectedSegmentIndex = tipDefaultIndex;
    recalculateTip()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    println("view did appear")
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    println("view will disappear")
  }
  
  override func viewDidDisappear(animated: Bool) {
    super.viewDidDisappear(animated)
    println("view did disappear")
  }
  
}

