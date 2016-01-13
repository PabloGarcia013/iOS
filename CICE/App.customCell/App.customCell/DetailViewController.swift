//
//  DetailViewController.swift
//  App.customCell
//
//  Created by CICE on 13/1/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - IBOulet
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailLastName: UILabel!
    
    
    //MARK: - VARIABLES GLOBALES LOCALES
    var detailNameText : String = ""
    var detailLastNameText : String = ""
    var detailImage : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailName.text = detailNameText
        detailLastName.text = detailLastNameText
        detailImageView.image = UIImage(named: detailImage)
        
        
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
