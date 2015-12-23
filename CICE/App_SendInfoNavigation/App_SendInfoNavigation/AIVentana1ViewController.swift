//
//  AIVentana1ViewController.swift
//  App_SendInfoNavigation
//
//  Created by CICE on 23/12/15.
//  Copyright © 2015 CICE. All rights reserved.
//

import UIKit

class AIVentana1ViewController: UIViewController {

    // MARK: - IBOULET
    
    @IBOutlet weak var name_text_view: UITextField!
    @IBOutlet weak var surname_text_view: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "to_second_view"){
            let view2 : AiVentana2ViewController = segue.destinationViewController as! AiVentana2ViewController
            view2.view2_name = name_text_view.text
            view2.view2_surname = surname_text_view.text
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}
