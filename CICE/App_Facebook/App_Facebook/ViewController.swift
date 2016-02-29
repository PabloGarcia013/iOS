//
//  ViewController.swift
//  App_Facebook
//
//  Created by CICE on 29/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonFacebook: UIButton!
    @IBOutlet weak var buttonTwitter: UIButton!
    
    //MARK: - IBACTION
    @IBAction func PostInFacebook(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            let postInFacebook : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            postInFacebook.setInitialText("Test share in facebook")
            //postInFacebook.addImage(UIImage(named: ""))
            postInFacebook.addURL(NSURL(string: "http://www.google.es"))
            
            presentViewController(postInFacebook, animated: true, completion: nil)
            
        }else{
            let alertC = UIAlertController(title: "Cuenta de Facebook", message: "Por favor haz login en Facebook para compartir", preferredStyle: .Alert)
            alertC .addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertC, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func PostInTwitter(sender: AnyObject) {
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            
            let postInTwitter : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            postInTwitter.setInitialText("Test share in twitter")
            postInTwitter.addURL(NSURL(string: "http://google.es"))
            
            presentViewController(postInTwitter,animated: true, completion: nil)
            
        }
        
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()

        postFacebook()

    }

    
    //MARK: - UTILS
    
    func postFacebook(){
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            buttonFacebook.setTitle("Postea en Facebook", forState: .Normal)
        }else{
            buttonFacebook.setTitle("Facebook no disponible", forState: .Normal)
        }
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            buttonTwitter.setTitle("Postea en Twitter", forState: .Normal)
        }else{
            buttonTwitter.setTitle("Twitter no disponible", forState: .Normal)
        }
        
    }
    
    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

    }


}

