//
//  AIDListadoTareasTableViewController.swift
//  App_Listado_de_tareas
//
//  Created by CICE on 18/1/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

// MARK: - VARIABLES EXTERNAS

class AIDListadoTareasTableViewController: UITableViewController {

    
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewDidAppear(animated: Bool) {
        
        if listadoTareas.count <= 0{
            let alert = UIAlertController(title: "No tienes tareas!", message: "No tienes ninguna tarea, vete a dormir!", preferredStyle: UIAlertControllerStyle.Alert)
            let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }else{
            myTableView.reloadData()
        }
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
        return listadoTareas.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let customCell : AIDCustomCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! AIDCustomCell
        if listadoTareas.count > 0{
            customCell.labelTarea.text = listadoTareas[indexPath.row]
            customCell.labelPrioridad.text = listadoPrioridad[indexPath.row]
            customCell.textViewDescripcion.text = listadoDescripcion[indexPath.row]
            let image : UIImage = UIImage(data: listadoFotos[indexPath.row])!
            customCell.cellImage.image = image
        }
        return customCell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            listadoTareas.removeAtIndex(indexPath.row)
            listadoPrioridad.removeAtIndex(indexPath.row)
            listadoDescripcion.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(listadoTareas[indexPath.row])
        print(listadoDescripcion[indexPath.row])
        print(listadoPrioridad[indexPath.row])
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
