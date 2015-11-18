//
//  ViewController.swift
//  App2_Objetos
//
//  Created by CICE on 18/11/15.
//  Copyright © 2015 CICE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES
    
    
    //MARK: - IB OUTLET
    
    
    @IBOutlet weak var myName: UILabel!
    @IBOutlet weak var myPhone: UILabel!
    @IBOutlet weak var myAddres: UILabel!
    
    //MARK: - IB ACTION
    @IBAction func myButton(sender: AnyObject) {
        myName.text = "Pablo García";
        myPhone.text = "61234567"
        myAddres.text = "Calle falsa 1234"
    }
    
    //MARK: - LIFE APP
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

