//
//  ViewController.swift
//  App6_HowManyFingers
//
//  Created by CICE on 2/12/15.
//  Copyright © 2015 AIDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var labelAutoNumber: UITextField!
    @IBOutlet weak var labelMyNumber: UITextField!
    @IBOutlet weak var labelResult: UITextField!
    @IBOutlet weak var labelPoints: UILabel!
    
    
    //MARK: - IBACTION
    
    @IBAction func guessTheNumber(sender: AnyObject) {
        
        let myNumber = Int(labelMyNumber.text!)
        let botNumber = Int(arc4random_uniform(9)+1)
        
        if let newNumber = myNumber{
            labelAutoNumber.text = String(botNumber)
            var points  = Int(labelPoints.text!)
            if newNumber==botNumber{
                labelResult.text = "Enhorabuena, has acertado!"
                points = points! + 1;
             
            }else{
                labelResult.text = "Has fallado, prueba otra vez!"
                points = points! - 1;
            }
            labelPoints.text = String(points!)
        }else{
            labelResult.text = "Introduce un numero entre 1 y 10"
        }
        
    }


}

