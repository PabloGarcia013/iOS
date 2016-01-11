//
//  TableViewControllerCoches.swift
//  TableViewCoches
//
//  Created by CICE on 11/1/16.
//  Copyright © 2016 A.I.Dev. All rights reserved.
//

import UIKit

class TableViewControllerCoches: UITableViewController {

    //MARK:- MODELO
    
    var coches : [ModelCoches] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.poblarCoches()
        
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
        return coches.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = coches[indexPath.row].name
        cell.detailTextLabel?.text = coches[indexPath.row].color

        return cell
    }
    
    func poblarCoches(){
        let coche1 : ModelCoches = ModelCoches(name: "Ford Focus",color: "Verde")
        let coche2 : ModelCoches = ModelCoches(name: "Golf",color: "Rojo")
        let coche3 : ModelCoches = ModelCoches(name: "Mercedes",color: "Azul")
        let coche4 : ModelCoches = ModelCoches(name: "BMW",color: "Amarillo")
        let coche5 : ModelCoches = ModelCoches(name: "Alfa Romeo",color: "Morado")
        let coche6 : ModelCoches = ModelCoches(name: "Toyota Corolla",color: "Negro")
        let coche7 : ModelCoches = ModelCoches(name: "Mini",color: "Gris")
        let coche8 : ModelCoches = ModelCoches(name: "Smart",color: "Naranja")
        let coche9 : ModelCoches = ModelCoches(name: "Porche",color: "Amarillo")
        let coche10 : ModelCoches = ModelCoches(name: "Nissan",color: "Granate")
        let coche11 : ModelCoches = ModelCoches(name: "Fiat 500",color: "Cyan")
        let coche12 : ModelCoches = ModelCoches(name: "Audi A5",color: "Azul")
        let coche13 : ModelCoches = ModelCoches(name: "Hammer",color: "Negro")
        let coche14 : ModelCoches = ModelCoches(name: "Renault Megane",color: "Verde")
        let coche15 : ModelCoches = ModelCoches(name: "Peugeot 306",color: "Gris")
        let coche16 : ModelCoches = ModelCoches(name: "Seat Ibiza",color: "Rojo")
        let coche17 : ModelCoches = ModelCoches(name: "Ford Mustang",color: "Negro")
        
        coches.append(coche1)
        coches.append(coche2)
        coches.append(coche3)
        coches.append(coche4)
        coches.append(coche5)
        coches.append(coche6)
        coches.append(coche7)
        coches.append(coche8)
        coches.append(coche9)
        coches.append(coche10)
        coches.append(coche11)
        coches.append(coche12)
        coches.append(coche13)
        coches.append(coche14)
        coches.append(coche15)
        coches.append(coche16)
        coches.append(coche17)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
