//
//  ViewController.swift
//  App4_FirstProject
//
//  Created by CICE on 25/11/15.
//  Copyright © 2015 Garcia.Pablo. All rights reserved.
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
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var pulsameButton: UIButton!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    //MARK: - IBAction
    
    @IBAction func onClickSocial(sender: AnyObject) {
        let title = "Redes Sociales"
        let mutableArray : NSMutableArray = ["Facebook","Twitter","Tuenti","Icospartan"]
        openAlertControllerPhoto(mutableArray, _title: title)
    }
    
    @IBAction func onClickMessage(sender: AnyObject) {
        let title = "Envio de Mensajes"
        let mutableArray : NSMutableArray = ["Mail","SMS","Telegram","Whatsapp"]
        openAlertControllerEnvio(mutableArray, _title: title)
    }
    
    @IBAction func onClickCamera(sender: AnyObject) {
        
    }
    
    @IBAction func onClickChat(sender: AnyObject) {
        
    }
    
    @IBAction func formAlertButton(sender: AnyObject) {
        // Creamos un array que pondra un texto transparente en los inputs.
        let arrayPlaceHolder: [String] = ["Nombre","Apellido","Dirección","Pais","Telefono","Email"]
        // Este array llevará los textfields del formulario
        var arrayValues: [UITextField] = []
        let alertController = UIAlertController(title: "Formulario", message: "Enviamos unos datos aleatorios", preferredStyle: UIAlertControllerStyle.Alert)
        
        // Añadimos dinamicamente los placeholder y los textfields.
        for var my_index = 0; my_index<arrayPlaceHolder.count; ++my_index{
            var txtField : UITextField?
            alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
                txtField = textField
                txtField?.placeholder=arrayPlaceHolder[my_index]
                arrayValues.insert(txtField!, atIndex: my_index)
            }
        }
        // Esta acción se llamará cuando se pulse ok en el formulario.
        let okAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action) -> Void in
            
            var my_bool = false;
            // Recorremos el array para ver que todos los valores estan correctamente.
            for var my_index = 0; my_index<arrayPlaceHolder.count; ++my_index{
                if arrayValues[my_index].text == ""{
                    my_bool=true;
                }
            }
            var alertConfirmation : UIAlertController?
            if my_bool==false{
                alertConfirmation = UIAlertController(title: "Correcto!", message: "Has enviado tu formulario de registro correctamente", preferredStyle: UIAlertControllerStyle.Alert)
            }else{
                alertConfirmation = UIAlertController(title: "ERROR", message: " has dejado algun campo vacío", preferredStyle: UIAlertControllerStyle.Alert)
            }
            
            let alertActionClose = UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil)
            alertConfirmation!.addAction(alertActionClose)
            self.presentViewController(alertConfirmation!, animated: true, completion: nil)
            
        }
        // Esta acción se llamara cuando se pulse cancel en el formulario.
        let cancelAlertAction = UIAlertAction(title: "CANCEL", style: UIAlertActionStyle.Default, handler: nil)
        alertController.addAction(okAlertAction)
        alertController.addAction(cancelAlertAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    //MARK: - Functions
    
    func openAlertControllerPhoto(_fields: NSMutableArray, _title: String){
        
        let numberOfFields = _fields.count
        let alertController = UIAlertController(title: _title, message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        for var index = 0; index < numberOfFields; ++index{
            
            let alertAction = UIAlertAction(title: _fields[index] as? String,
            style: .Default) { (UIAlertAction) -> Void in
                let image: UIImage = UIImage(named: UIAlertAction.title!)!
                self.resultImage.image = image
            }
            alertController.addAction(alertAction)
        }
        let okAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alertController.addAction(okAlertAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func openAlertControllerEnvio(_fields: NSMutableArray, _title: String){
        let alertController = UIAlertController(title: _title, message: "Enviamos un mensaje via:", preferredStyle: UIAlertControllerStyle.ActionSheet)
        for var index2 = 0; index2 < _fields.count; ++index2{
            let alertAction = UIAlertAction(title: _fields[index2] as? String, style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                self.resultLabel.text = "Enviando un mensaje via "+UIAlertAction.title!
            })
            alertController.addAction(alertAction)
        }
        let okAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alertController.addAction(okAlertAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}





















