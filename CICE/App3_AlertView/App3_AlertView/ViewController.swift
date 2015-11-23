//
//  ViewController.swift
//  App3_AlertView
//
//  Created by CICE on 23/11/15.
//  Copyright © 2015 CICE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        // Declaramos un Alert View.
        /*let alertView = UIAlertView(title: "SALUDAMOS", message: "Hola estamos saludando!", delegate: nil, cancelButtonTitle: "Cancelar")
        alertView.show()*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBOutlet
    

    //MARK: - IBAction
    
    @IBAction func playButton(sender: AnyObject) {
        showMessageInAlert("Play", _message: "Estamos pulsando el boton play")
    }
    
    @IBAction func pauseButton(sender: AnyObject) {
        showMessageInAlert("Pause", _message: "Estamos pulsando el boton pause")
    }
    
    @IBAction func fastButton(sender: AnyObject) {
        showMessageInAlert("Fast", _message: "Estamos pulsando el boton fast")
    }
    
    @IBAction func rewindButton(sender: AnyObject) {
        showMessageInAlert("Rewind", _message: "Estamos pulsando el boton rewind")
    }
    @IBAction func showAlertWithTextField(sender: AnyObject) {
        var loginTextField:UITextField?
        let alertController = UIAlertController(title: "UIAlertController",
            message: "Con campo de texto",
            preferredStyle: UIAlertControllerStyle.Alert)
        let ok = UIAlertAction(title: "Ok",
            style: .Default) { (UIAlertAction) -> Void in
                print("OK: "+(loginTextField?.text)!)
        }
        let cancel = UIAlertAction(title: "Cancel",
            style: .Default) { (UIAlertAction) -> Void in
                print("Cancel: "+(loginTextField?.text)!)
        }
        alertController.addAction(ok)
        alertController.addAction(cancel)
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            loginTextField = textField
            loginTextField?.placeholder = "Enter your ID"
        }
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func onClickAlert(sender: AnyObject) {
        // Construimos nuestro alert Componente que estará compuesto de titulo, mensaje y un estilo.
        let alertController = UIAlertController (title: "Nueva Alerta!", message: "Estamos mostrando una nueva alerta", preferredStyle: UIAlertControllerStyle.Alert)
        // Creamos la acción del boton.
        // El Handler (Manejador) es un método de clausura. El metodo de clausura se suele usar para trabajos en background -> métodos asyncronos.
        let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alertController.addAction(alertAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func showMessageInAlert(_title: String, _message: String){
        let submenu = UIAlertController(title: _title, message: _message, preferredStyle: UIAlertControllerStyle.ActionSheet)
        let alertAction = UIAlertAction(title: "Opción 1 de "+_title, style: UIAlertActionStyle.Default){(alert) -> Void in print("ha seleccionado la opcion 1 "+_title)}
        let alertAction2 = UIAlertAction(title: "Opción 2 de "+_title, style: UIAlertActionStyle.Default){(alert) -> Void in print("ha seleccionado la opcion 2 "+_title)}
        let cancelAction = UIAlertAction(title: "CANCEL", style: UIAlertActionStyle.Cancel, handler: nil)
        
        submenu.addAction(alertAction)
        submenu.addAction(alertAction2)
        submenu.addAction(cancelAction)
        
        presentViewController(submenu, animated: true, completion: nil)
    }
    
}

 