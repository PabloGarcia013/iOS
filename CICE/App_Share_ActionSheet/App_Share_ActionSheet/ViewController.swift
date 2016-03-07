//
//  ViewController.swift
//  App_Share_ActionSheet
//
//  Created by CICE on 2/3/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func share(sender: AnyObject) {
        
        
        let textoCompartir = "Test share in Facebook iOS."
        let webCompartir = NSURL(string: "http://www.google.es")
        let imagenesCompartir = UIImage(named:"flappy.png")
        
        let compartirVC : UIActivityViewController = UIActivityViewController(activityItems: [textoCompartir,webCompartir!,imagenesCompartir!], applicationActivities: nil)
        
        presentViewController(compartirVC, animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

