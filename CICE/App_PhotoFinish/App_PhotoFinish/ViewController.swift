//
//  ViewController.swift
//  App_PhotoFinish
//
//  Created by CICE on 4/3/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    // MARK: - VARIABLES LOCALES
    
    var signUpActive = true;
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var myActivityIndicatorAI: UIActivityIndicatorView!
    
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var alreadyRegistered: UILabel!
    @IBOutlet weak var singUpToggle: UIButton!
    @IBOutlet weak var labelText: UILabel!
    
    
    @IBAction func signUpNewUser(sender: AnyObject) {
        
        //FASE 1 -> comprobamos que nuestra informacion esta correctamente alimentada, tanto el usuario como el password, para eso vamos gestionar errores
        var error = "" // -> este error nos permitira pintar las muchas o pcas cosas que nos pueda pasar en el momento de registro del un usuario
        
        if usernameTF.text == "" || passwordTF.text == ""{
        
            error = "Por favor introduce un Usuario \n y un Password"
        
        }else{
            
            myActivityIndicatorAI.hidden = false
            myActivityIndicatorAI.startAnimating()
            
            //Aqui bloquemos los botones para que no se hagan mas toques y solo se realice una unica vez
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            
            if(signUpActive){
                //FASE 2 -> Aqui traemos desde PARSE el registro de usuarios
                let user = PFUser()
                
                user.username = usernameTF.text
                user.password = passwordTF.text
                
                //Aqui creamos el usuario Asincronamente en 2 plano
                user.signUpInBackgroundWithBlock {
                    
                    //Cambiamos el nombre de este error que nos traemos
                    (succeeded: Bool, sigUpError: NSError?) -> Void in
                    
                    self.myActivityIndicatorAI.hidden = true
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
                    
                    
                    if let errorData = sigUpError {
                        
                        
                        //Aqui debemos comprobar si esto devuelve algun mensaje pues puede ser que en este diccionario de errorres no siempre me venga un error
                        if let errorString = errorData.userInfo["error"] as? NSString{
                            
                            self.showAlertViewController("Error al Registrar", messageData: errorString as String)
                            
                        }else{
                            
                            self.showAlertViewController("Error al Registrar", messageData: "por favor reintenta el registro")
                        }
                        
                        
                    } else {
                        
                        print("El Usuario ha logrado Registrarse")
                        
                        self.usernameTF.text = ""
                        self.passwordTF.text = ""
                        
                        self.performSegueWithIdentifier("jumpToUserController", sender: self)
                        
                    }
                }
            }else{
                
                PFUser.logInWithUsernameInBackground(self.usernameTF.text!, password: self.passwordTF.text!){
                    (user: PFUser?, loginError: NSError?) -> Void in
                    if user != nil{
                        print("El usuario ha podido acceder")
                        
                        self.performSegueWithIdentifier("jumpToUserController", sender: self)
                        
                        self.usernameTF.text = ""
                        self.passwordTF.text = ""
                        
                    }else{
                        
                        if let errorData = loginError {
                            
                            
                            //Aqui debemos comprobar si esto devuelve algun mensaje pues puede ser que en este diccionario de errorres no siempre me venga un error
                            if let errorString = errorData.userInfo["error"] as? NSString{
                                
                                self.showAlertViewController("Error al Acceder", messageData: errorString as String)
                                
                            }else{
                                
                                self.showAlertViewController("Error al Acceder", messageData: "por favor reintenta el acceso")
                            }
                            
                            
                        }
                        
                        
                    }
                }
                
            }
            
        }
        
        if error != ""{
            
            showAlertViewController("Error en Registro", messageData: error)
            
        }
        
    }
    
    // FASE 2 -> Esta accion, cambia un modo de presentación por otro.

    @IBAction func signUpToggleAction(sender: AnyObject) {
        
        if(self.signUpActive){
            
            //Aquí estoy en modo registro. Voy a modo acceso.
            
            self.singUpToggle.setTitle("Registrarse", forState: .Normal)
            self.alreadyRegistered.text = "No Registrado"
            signUp.setTitle("Acceder", forState: .Normal)
            labelText.text = "Usa el formulario inferior para acceder"
            
        }else{
            
            self.singUpToggle.setTitle("Accede", forState: .Normal)
            self.alreadyRegistered.text = "Ya Registrado?"
            signUp.setTitle("Registrarme", forState: .Normal)
            labelText.text = "Usa el formulario inferior para registrarte"
            
        }
        
        self.signUpActive = !self.signUpActive
    }

    
    
    //MARK: - UTILS
    func showAlertViewController(titleData : String, messageData : String){
        
        let alertVC = UIAlertController(title: titleData, message: messageData, preferredStyle: .Alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        presentViewController(alertVC, animated: true, completion: nil)
        
    }
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myActivityIndicatorAI.hidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //Comprobamos que algun usuario ha accedido o registrado
        
        if PFUser.currentUser() != nil{
            self.performSegueWithIdentifier("jumpToUserController", sender: self)
        }
        
        
    }


}

