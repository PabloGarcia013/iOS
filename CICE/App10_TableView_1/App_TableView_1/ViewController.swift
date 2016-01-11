//
//  ViewController.swift
//  App_TableView_1
//
//  Created by CICE on 11/1/16.
//  Copyright © 2016 A.I.Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Variables Locales
    
    let miArray = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Dicembre"]
    
    
    //MARK: - IBOulet
    @IBOutlet weak var miTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Registro de la celda
        miTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
    //MARK: - UITableView DataSource
    
    extension ViewController: UITableViewDataSource{
        
        // Numero de seciones en la tableView.
        func numberOfSectionsInTableView(tableView: UITableView) -> Int{
            return 1
        }
        
        // Devuelve el numero de filas en la seccion 'section'.
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return miArray.count
        }
        
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            let cell : UITableViewCell = miTableView.dequeueReusableCellWithIdentifier("Cell")!
            cell.textLabel?.text = miArray[indexPath.row]
            return cell
        }
        
    }


    //MARK: - UITableView Delegate
    extension ViewController: UITableViewDelegate{
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            print(miArray[indexPath.row])
        }
    }


