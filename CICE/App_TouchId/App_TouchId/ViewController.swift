//
//  ViewController.swift
//  App_TouchId
//
//  Created by CICE on 29/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES
    // Creamos una variable de autentificación.
    var touchIDContext = LAContext()
    let message = "Necesito saber que eres tu"
    let alertController = UIAlertController(title: "", message: "", preferredStyle: .Alert)
    
    
    
    //MARK: - IBOULET
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCommentary: UILabel!
    
    @IBAction func unlockTouchId(sender: AnyObject) {
        
        labelTitle.text = "Autenticando..."
        var touchIDError : NSError?
        
        // Compruebo si podemos acceder a la autenticación.
        if touchIDContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &touchIDError){
            
            // Comprobamos la respuesta a esa autenticación.
            touchIDContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: message, reply: { (success, error) -> Void in
                if success{
                    self.labelTitle.text = "TouchID exitoso."
                    self.labelCommentary.text = "Has logrado demostrar que eres tu."
                    
                    self.alertController.title = "Exitoso!"
                    self.alertController.message = "Se que eres tu."
                    
                }else{
                    
                    self.labelTitle.text = "TouchID ha fallado."
                    self.labelCommentary.text = "Ha fallado la autenticación con el dispositivo."
                    
                    self.alertController.title = "Ha fallado la autenticación!"
                    switch error!.code{
                        
                    case LAError.AuthenticationFailed.rawValue:
                        self.alertController.message = "Fallo en la autentificación."
                        break
                    case LAError.UserCancel.rawValue:
                        self.alertController.message = "El usuario ha cancelado la autenticación."
                        break
                    case LAError.SystemCancel.rawValue:
                        self.alertController.message = "El sistema ha cancelado la autenticación."
                        break
                    case LAError.UserFallback.rawValue:
                        self.alertController.message = "Solicito que ingreses con la contraseña."
                        break
                    default:
                        self.alertController.message = "Error indetermindado."

                    }
                }
                self.presentViewController(self.alertController, animated: true, completion: { () -> Void in
                    self.labelCommentary.text = self.message
                })
            
            })
        }else{
            self.labelTitle.text = "Autenticación local fallida."
            self.alertController.title = "No se pudo autenticar."
            
            switch touchIDError!.code{
            case LAError.TouchIDNotAvailable.rawValue:
                self.alertController.message = "No existe TouchID en tu dispositivo."
                break
            case LAError.TouchIDNotEnrolled.rawValue:
                self.alertController.message = "No tienes huellas almacenadas."
                break
            case LAError.PasscodeNotSet.rawValue:
                self.alertController.message = "No hay contraseñas asignadas."
                break
            default:
                self.alertController.message = "Algo ha ido mal en la autentifación local"
            }
            
            presentViewController(self.alertController, animated: true, completion: { () -> Void in
                self.labelCommentary.text = self.alertController.message
            })
        }
        
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

