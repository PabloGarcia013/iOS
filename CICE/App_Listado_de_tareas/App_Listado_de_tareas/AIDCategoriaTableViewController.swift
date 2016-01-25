//
//  AIDCategoriaTableViewController.swift
//  App_Listado_de_tareas
//
//  Created by CICE on 18/1/16.
//  Copyright © 2016 CICE. All rights reserved.
//




import UIKit

var listadoTareas = [String]()
var listadoDescripcion = [String]()
var listadoPrioridad = [String]()

var listadoFotos = [NSData]()

class AIDCategoriaTableViewController: UITableViewController {

    
    var nombreCategoriaSelecionada  = ""
    
    var seleccionIndexPath = NSIndexPath()
    
    var listadoCategorias = ["Sin Categoría","Tienda de Apple", "Bar", "Mercadona", "Peluqueria", "Parque","Iglesia","Pistas de Padel","Colegio","","",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0..<listadoCategorias.count{
            if listadoCategorias[index] == nombreCategoriaSelecionada{
                seleccionIndexPath = NSIndexPath(forRow: index, inSection: 0)
            }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listadoCategorias.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let nombreCategoria = listadoCategorias[indexPath.row]
        cell.textLabel?.text = nombreCategoria
        
        if nombreCategoria == nombreCategoriaSelecionada{
            cell.accessoryType = .Checkmark
        }else{
            cell.accessoryType = .None
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row != seleccionIndexPath.row{
            
            if let nuevaCeldaSeleccionada = tableView.cellForRowAtIndexPath(indexPath){
                nuevaCeldaSeleccionada.accessoryType = .Checkmark
            }
            if let antiguaCeldaSeleccionada = tableView.cellForRowAtIndexPath(seleccionIndexPath){
                antiguaCeldaSeleccionada.accessoryType = .None
            }
            seleccionIndexPath = indexPath
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if( segue.identifier == "pasoDeInformacionTareas"){
            let cell = sender as! UITableViewCell
            if let indexPath = tableView.indexPathForCell(cell){
                nombreCategoriaSelecionada = listadoCategorias[indexPath.row]
            }
        }
    }
    

}
