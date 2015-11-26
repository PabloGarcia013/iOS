//
//  ViewController.swift
//  App4_TabBar
//
//  Created by cice on 25/11/15.
//  Copyright (c) 2015 Garcia.Pablo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClickSocial(sender: AnyObject) {
        let tittle = "Redes Sociales"
        let mutableArray : NSMutableArray = ["Facebook","Twitter","Tuenti","iCoSpartan"]
        openAlertController(mutableArray, _title: tittle)
    }
    
    @IBAction func onClickMessage(sender: AnyObject) {
        let tittle = "Envio de Mensajes"
        let mutableArray : NSMutableArray = ["Mail","SMS","Telegram","Whatsapp"]
        openAlertController(mutableArray, _title: tittle)
    }

    @IBAction func onClickCamera(sender: AnyObject) {
        let tittle = "Escoge la Cámara"
        let mutableArray : NSMutableArray = ["Desde la biblioteca","Abre la App Photo","Cámara","Photo Kit"]
        openAlertController(mutableArray, _title: tittle)
    }
    
    @IBAction func onClickChat(sender: AnyObject) {
        let tittle = "Escribe un Chat"
        let mutableArray : NSMutableArray = ["desde Whatsapp","desde iCoSpartan","desde Twitter","desde Tuenti"]
        openAlertController(mutableArray, _title: tittle)
    }
    
    func openAlertController(_fields: NSMutableArray, _title: String){
        let number_of_fields = _fields.count
        let alertController = UIAlertController(title: _title, message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        for var index = 0; index < number_of_fields; ++index{
            let alertAction = UIAlertAction(title: _fields[index] as? String, style: UIAlertActionStyle.Default, handler: nil)
            alertController.addAction(alertAction)
        }
        let okAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alertController.addAction(okAlertAction)
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    
}

