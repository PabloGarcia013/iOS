//
//  ViewController.swift
//  App5_My Dog Age
//
//  Created by CICE on 2/12/15.
//  Copyright © 2015 AIDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - VARIABLES GLOBAL
    
    //MARK: - IBOUTLES
    
    @IBOutlet weak var textFileCatAge: UITextField!
    @IBOutlet weak var labelResult: UILabel!
    
    //MARK: - IBACTION
    
    @IBAction func calculateAge(sender: AnyObject) {
        
        let insertNewAge: Int?
        insertNewAge = Int(textFileCatAge.text!)
        
        // OPTIONAL BIDING
        if let newAge = insertNewAge{
            let showNewAge = newAge * 7
            labelResult.text = "La edad de mi perro es: \(showNewAge)"
        }else{
            let alertView = UIAlertController(title: "Error", message: "Por favor introduce la edad de tu perro", preferredStyle: UIAlertControllerStyle.Alert)
            let actionView = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alertView.addAction(actionView)
            presentViewController(alertView, animated: true, completion: nil)
        }
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

    //MARK: - UTILS
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

