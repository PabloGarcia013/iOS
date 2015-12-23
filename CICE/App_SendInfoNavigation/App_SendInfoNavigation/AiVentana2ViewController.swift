//
//  AiVentana2ViewController.swift
//  App_SendInfoNavigation
//
//  Created by CICE on 23/12/15.
//  Copyright © 2015 CICE. All rights reserved.
//

import UIKit

class AiVentana2ViewController: UIViewController {
    
    

    // MARK: - IBOULET
    
    @IBOutlet weak var cat_age_text_view: UITextField!
    @IBOutlet weak var user_view2_name: UILabel!
    @IBOutlet weak var user_view2_surname: UILabel!
    
    // MARK: - VARIABLES GLOBALES
    var view2_name : String?
    var view2_surname : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user_view2_name.text = view2_name
        user_view2_surname.text = view2_surname
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "go_to_third_view"){
            let view3 : AIVentana3ViewController = segue.destinationViewController as! AIVentana3ViewController
                view3.user_name_view3 = view2_name
                view3.user_surname_view3 = view2_surname
                view3.cat_age_view3 = cat_age_text_view.text
        }
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}
