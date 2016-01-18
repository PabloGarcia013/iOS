//
//  AIDTareasViewController.swift
//  App_Listado_de_tareas
//
//  Created by CICE on 18/1/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class AIDTareasViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate{
    
    // MARK: - IBOULET
    
    @IBOutlet weak var textFieldTarea: UITextField!
    @IBOutlet weak var textViewDescripcion: UITextView!
    @IBOutlet weak var textFieldPrioridad: UITextField!
    @IBOutlet weak var labelCategoria: UILabel!
    
    
    // MARK: - IBACTION
    
    
    @IBAction func salvarInformacionTableView(sender: AnyObject) {
        
        listadoTareas.append(textFieldTarea.text!)
        listadoDescripcion.append(textViewDescripcion.text!)
        listadoPrioridad.append(textFieldPrioridad.text!)
        
        NSUserDefaults.standardUserDefaults().setObject(listadoTareas, forKey: "listadoTareas")
        NSUserDefaults.standardUserDefaults().setObject(listadoDescripcion, forKey: "listadoDescripcion")
        NSUserDefaults.standardUserDefaults().setObject(listadoPrioridad, forKey: "listadoPrioridad")

    }
    
    // MARK: - VARIABLES LOCALES
    
    var nombreCategoria = "Sin categoria"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSUserDefaults.standardUserDefaults().setObject(listadoTareas, forKey: "listadoTareas")
        NSUserDefaults.standardUserDefaults().setObject(listadoDescripcion, forKey: "listadoDescripcion")
        NSUserDefaults.standardUserDefaults().setObject(listadoPrioridad, forKey: "listadoPrioridad")
        
        textViewDescripcion.delegate = self
        textFieldPrioridad.delegate = self
        textFieldTarea.delegate = self
        
        labelCategoria.text = nombreCategoria
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
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
