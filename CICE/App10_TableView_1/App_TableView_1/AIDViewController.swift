//
//  AIDViewController.swift
//  App_TableView_1
//
//  Created by CICE on 13/1/16.
//  Copyright © 2016 A.I.Dev. All rights reserved.
//

import UIKit

class AIDViewController: UIViewController {
    
    
    var dataName : String = ""
    
    @IBOutlet weak var myLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel.text = dataName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
