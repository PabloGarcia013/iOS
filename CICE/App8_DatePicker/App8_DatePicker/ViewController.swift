//
//  ViewController.swift
//  App8_DatePicker
//
//  Created by CICE on 9/12/15.
//  Copyright © 2015 A.I.Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOULET
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBAction func showPickerDateEditedDateTextField(sender: UITextField) {

        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.DateAndTime
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UTILS
    func datePickerValueChanged(sender: UIDatePicker){
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        dateTextField.text = dateFormatter.stringFromDate(sender.date)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }


}

