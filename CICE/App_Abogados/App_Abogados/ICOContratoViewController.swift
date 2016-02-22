//
//  ICOContratoViewController.swift
//  App_Abogados
//
//  Created by CICE on 22/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit
import CoreData

class ICOContratoViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES
    
    var manageObjectContext : NSManagedObjectContext?
    
    //MARK: - IBOULET
    
    @IBOutlet weak var textFieldDia: UITextField!
    @IBOutlet weak var textFieldMes: UITextField!
    @IBOutlet weak var textFieldNombreApellidos: UITextField!
    @IBOutlet weak var textFieldEmpresa: UITextField!
    @IBOutlet weak var textFieldDireccion: UITextField!
    @IBOutlet weak var textFieldDespacho: UITextField!
    @IBOutlet weak var textFieldCuenta: UITextField!
    @IBOutlet weak var textFieldTitular: UITextField!
    @IBOutlet weak var textFieldColegiado1: UITextField!
    @IBOutlet weak var textFieldColegiado2: UITextField!
    @IBOutlet weak var textViewObservaciones: UITextView!
    
    //MARK: - IBACTION
    
    @IBAction func salvarDatos(sender: AnyObject) {
        
        // Creamos una entrada general a la base de datos.
        let newData = NSEntityDescription.insertNewObjectForEntityForName("Contrato", inManagedObjectContext: manageObjectContext!) as! Contrato
        newData.setValue(textFieldDia.text, forKey: "diaFecha")
        newData.setValue(textFieldMes.text, forKey: "mesFecha")
        newData.setValue(textFieldNombreApellidos.text, forKey: "nombreYApellido")
        newData.setValue(textFieldEmpresa.text, forKey: "nombreEmpresa")
        newData.setValue(textFieldDireccion.text, forKey: "direccionEmpresa")
        newData.setValue(textFieldDespacho.text, forKey: "despachoAbogados")
        newData.setValue(textFieldCuenta.text, forKey: "colegiado1")
        newData.setValue(textFieldTitular.text, forKey: "colegiado2")
        newData.setValue(textFieldColegiado1.text, forKey: "observacionesGenerales")
        newData.setValue(textFieldColegiado2.text, forKey: "cuentaBancaria")
        newData.setValue(textViewObservaciones.text, forKey: "titularCuenta")
        
        //Guardamos la info
        
        do{
            try manageObjectContext!.save()
        }catch let error{
            print(error)
        }
        print(newData)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Fase de conexion con el delegado.
        
        let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        
        //Fase -> creamos el objeto que nos permitira crear una interfaz con la que podremos acceder a nuestra base de datos.
        manageObjectContext = appDelegate.managedObjectContext
        
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
