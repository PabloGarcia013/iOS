//
//  AIVenana3ViewController.swift
//  App_SendInfoNavigation
//
//  Created by CICE on 23/12/15.
//  Copyright © 2015 CICE. All rights reserved.
//

import UIKit

class AIVentana3ViewController: UIViewController {

    
    // MARK: - VARIABLES LOCALES
    
    var user_name_view3 :String?
    var user_surname_view3 : String?
    var cat_age_view3 : String?
    
    // MARK: - IBOULET
    
    @IBOutlet weak var user_name_label_view3: UILabel!
    @IBOutlet weak var user_surname_label_view3: UILabel!
    @IBOutlet weak var cat_age_label_view3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user_name_label_view3.text = user_name_view3
        user_surname_label_view3.text = user_surname_view3
        
        let cat_age :Int? = Int(cat_age_view3!)
        let final_age = cat_age! * 7
        cat_age_label_view3.text = String(final_age)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
