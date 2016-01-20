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
    @IBOutlet weak var myImage: UIImageView!
    
    
    // MARK: - IBACTION
    
    @IBAction func showMenuPickerPhoto(sender: AnyObject) {
        pickerPhoto()
    }
    
    @IBAction func salvarInformacionTableView(sender: AnyObject) {
        
        if textFieldTarea.text == nil || textViewDescripcion.text == nil || myImage.image == nil || textViewDescripcion.text == nil{
            let alertController = UIAlertController(title: "ERROR!", message: "No has introducido alguno de los campos, por farvor rellenalo", preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alertController.addAction(alertAction)
            presentViewController(alertController, animated: true, completion: nil)
        } else {
            let imageDataComplete : NSData = UIImageJPEGRepresentation(myImage.image!, 1)!
            listadoFotos.append(imageDataComplete)
            listadoTareas.append(textFieldTarea.text!)
            listadoDescripcion.append(textViewDescripcion.text!)
            listadoPrioridad.append(textFieldPrioridad.text!)
            
            let alertController = UIAlertController(title: "Tarea Guardado!", message: "Has guardado tu tarea correctamente!", preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alertController.addAction(alertAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
        
        
        
    }
    
    // MARK: - VARIABLES LOCALES
    
    var nombreCategoria = "Sin categoria"
    var pickerData = ["Muy Alta", "Alta", "Media", "Baja", "Muy Baja"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("listadoTareas") != nil){
            listadoTareas = NSUserDefaults.standardUserDefaults().objectForKey("listadoTareas") as! [String]
        }
        if(NSUserDefaults.standardUserDefaults().objectForKey("listadoDescripcion") != nil){
            listadoDescripcion = NSUserDefaults.standardUserDefaults().objectForKey("listadoDescripcion") as! [String]
        }
        if(NSUserDefaults.standardUserDefaults().objectForKey("listadoPrioridad") != nil){
            listadoPrioridad = NSUserDefaults.standardUserDefaults().objectForKey("listadoPrioridad") as! [String]
        }
        if(NSUserDefaults.standardUserDefaults().objectForKey("listadoFotos") != nil){
            listadoFotos = NSUserDefaults.standardUserDefaults().objectForKey("listadoFotos") as! [NSData]
        }
                
        labelCategoria.text = nombreCategoria
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
   
        textFieldPrioridad.inputView = pickerView
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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


// MARK: - DELEGATE PICKER VIEW
extension AIDTareasViewController : UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textFieldPrioridad.text = pickerData[row]
        self.view.endEditing(true)
    }
    
}

// MARK: - DELEGATE PICKER PHOTO
extension AIDTareasViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    func pickerPhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            showPhotoMenu()
        }else{
            choosePhotoLibrary()
        }
    }
    
    func showPhotoMenu(){
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .Default, handler: nil)
        let takePhotoAction = UIAlertAction(title: "Take Photo", style: .Default) { (action) -> Void in
            self.takePhotoWithCamera()
        }
        
        let chooseFromLibrary = UIAlertAction(title: "Choose From Library", style: .Default) { (action) -> Void in
            self.choosePhotoLibrary()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(takePhotoAction)
        alertController.addAction(chooseFromLibrary)
        presentViewController(alertController, animated: true, completion: nil)
        
        
    
    }
    
    func takePhotoWithCamera(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .Camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func choosePhotoLibrary(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        myImage.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
}

