//
//  ViewController.swift
//  App_internacionalizacion
//
//  Created by CICE on 29/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //MARK: - IBOULET
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var labelNumber: UILabel!
    @IBOutlet weak var labelCurrency: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changedValue();
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - UTILS
    func changedValue(){
        labelText.text = "Good morning"
        labelNumber.text = "9.99999"
        labelCurrency.text = "50.0001"
        labelDate.text = "\(NSDate())"
        imageView.image = UIImage(named: "hello_world.png")
    }


}

