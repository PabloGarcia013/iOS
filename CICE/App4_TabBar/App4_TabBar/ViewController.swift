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
        var tittle = "Redes Sociales"
        var mutableArray : NSMutableArray = ["Facebook","Twitter","Tuenti","iCoSpartan"]
        openAlertController(mutableArray, _title: tittle)
    }
    
    @IBAction func onClickMessage(sender: AnyObject) {
        var tittle = "Envio de Mensajes"
        var mutableArray : NSMutableArray = ["Mail","SMS","Telegram","Whatsapp"]
        openAlertController(mutableArray, _title: tittle)
    }

    @IBAction func onClickCamera(sender: AnyObject) {
        var tittle = "Escoge la Cámara"
        var mutableArray : NSMutableArray = ["Desde la biblioteca","Abre la App Photo","Cámara","Photo Kit"]
        openAlertController(mutableArray, _title: tittle)
    }
    
    @IBAction func onClickChat(sender: AnyObject) {
        var tittle = "Escribe un Chat"
        var mutableArray : NSMutableArray = ["desde Whatsapp","desde iCoSpartan","desde Twitter","desde Tuenti"]
        openAlertController(mutableArray, _title: tittle)
    }
    
    func openAlertController(_fields: NSMutableArray, _title: String){
        var number_of_fields = _fields.count
        let alertController = UIAlertController(title: _title, message: "", preferredStyle: UIAlertControllerStyle.Alert)
        for var index = 0; index < number_of_fields; ++index{
            let alertAction = UIAlertAction(title: _fields[index] as! String, style: UIAlertActionStyle.Default, handler: nil)
            alertController.addAction(alertAction)
        }
        let okAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alertController.addAction(okAlertAction)
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    
}

