//
//  ICODetailViewController.swift
//  App_Abogados
//
//  Created by CICE on 24/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit
import CoreData

class ICODetailViewController: UIViewController {
    
    var selectContratosDataBase : Contrato!
    var manageObjectContext : NSManagedObjectContext?
    
    //MARK: - IBOULET
    @IBOutlet weak var textFieldDia: UITextField!
    @IBOutlet weak var textFieldMes: UITextField!
    @IBOutlet weak var textFieldNombre: UITextField!
    @IBOutlet weak var textFieldEmpresa: UITextField!
    @IBOutlet weak var textFieldDireccion: UITextField!
    @IBOutlet weak var textFieldDespacho: UITextField!
    @IBOutlet weak var textFieldColegiado1: UITextField!
    @IBOutlet weak var textFieldColegiado2: UITextField!
    @IBOutlet weak var textViewObservacion: UITextView!
    @IBOutlet weak var textFieldCuenta: UITextField!
    @IBOutlet weak var textViewTitularCuenta: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        initSetup()
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hecho", style: self.editButtonItem().style, target: self, action: "doneButtonPressed")
        
        // Do any additional setup after loading the view.
    }
    
    func doneButtonPressed(){
        navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initSetup(){
        
        textFieldDia.text = selectContratosDataBase.diaFecha
        textFieldMes.text = selectContratosDataBase.mesFecha
        textFieldNombre.text = selectContratosDataBase.nombreYApellido
        textFieldEmpresa.text = selectContratosDataBase.nombreEmpresa
        textFieldDireccion.text = selectContratosDataBase.direccionEmpresa
        textFieldDespacho.text = selectContratosDataBase.despachoAbogados
        textFieldColegiado1.text = selectContratosDataBase.colegiado1
        textFieldColegiado2.text = selectContratosDataBase.colegiado2
        textFieldCuenta.text = selectContratosDataBase.cuentaBancaria
        textViewObservacion.text = selectContratosDataBase.observacionesGenerales
        textViewTitularCuenta.text = selectContratosDataBase.titularCuenta
        
        
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
