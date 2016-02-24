//
//  ViewController.swift
//  App_JSon
//
//  Created by CICE on 24/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        //Descargar la información desde la url
        let url = NSURL(string:"http://api.openweathermap.org/data/2.5/weather?q=London&appid=44db6a862fba0b067b1930da0d769e98")
        
        //creamos una tarea en segundo plano (que va a ser una lectura del tipo de formato json)
        //Este objecto esta relacionado con la api de apple para la descargar de contenido asyncrona
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
            if error != nil{
                print(error)
            }else{
                //sacamos los datos en formato JSON y los analizamos en ios ->  Hay una clase que se llama NSJSONSerialization que a su vez tiene metodos inicializadores, funciones.
                if let JSONResult = try? NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers){
                    print(JSONResult["base"]!!)
                    print(JSONResult.valueForKey("base")!)
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

