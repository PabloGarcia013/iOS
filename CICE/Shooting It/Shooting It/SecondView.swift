//
//  SecondView.swift
//  Shooting It
//
//  Created by CICE on 14/12/15.
//  Copyright © 2015 A.I.Dev. All rights reserved.
//

import UIKit

class SecondView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBACTION
    
    @IBAction func closeInfoView(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
