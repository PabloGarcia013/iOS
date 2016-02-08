//
//  ViewController.swift
//  DescargaAsync
//
//  Created by CICE on 8/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
//MARK: - IBOULET
    
    @IBOutlet weak var imageViewResult: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

//MARK: - IBACTION
    
    @IBAction func onClickDownload(sender: AnyObject) {
        
        
        /* DESCARGA SINCRONA.

        let url = NSURL(string: "https://f1.bcbits.com/img/a1238763482_10.jpg")
        
        let data = NSData(contentsOfURL: url!)
        
        let imageData = UIImage(data: data!)
        
        imageViewResult.image = imageData
        
        activityIndicator.hidden = true
     
        */
        
        
        let granCentralDispatch : dispatch_queue_t = dispatch_queue_create("Izal", nil)
        
        activityIndicator.hidden = false;
        activityIndicator.startAnimating()
        
        
        // Creamos el bloque en 2 hilos.
        
        dispatch_async(granCentralDispatch) { () -> Void in
            
            let url = NSURL(string: "https://f1.bcbits.com/img/a1238763482_10.jpg")
            
            let data = NSData(contentsOfURL: url!)
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let imageData = UIImage(data: data!)
                
                self.imageViewResult.image = imageData
                
                self.activityIndicator.hidden = true
            })
            
            
            // Creamos el primer hilo.
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidden = true;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

