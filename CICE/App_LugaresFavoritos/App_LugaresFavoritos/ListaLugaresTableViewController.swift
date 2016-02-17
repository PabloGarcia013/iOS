//
//  ListaLugaresTableViewController.swift
//  App_LugaresFavoritos
//
//  Created by CICE on 17/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

//MARK: - VARIABLES EXTERNAS
var lugaresGuardados = [Dictionary<String, String>]()
var lugarActivo = -1

class ListaLugaresTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        lugaresGuardados.append(["name" : "CICE", "subtitle" : "Escuela de nuevas tecnologias", "lat" : "40.4336", "long" : "-3.6762"])
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
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
        return lugaresGuardados.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        cell.textLabel?.text = lugaresGuardados[indexPath.row]["name"]
        cell.detailTextLabel?.text = lugaresGuardados[indexPath.row]["subtitle"]

        return cell
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        lugarActivo = indexPath.row
        return indexPath
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showMapViewController"){
            lugarActivo = -1
        }else if(segue.identifier == "showFavoritePlace"){
            
        }
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
        let itemMove = lugaresGuardados[fromIndexPath.row]
        lugaresGuardados.removeAtIndex(fromIndexPath.row)
        lugaresGuardados.insert(itemMove, atIndex: toIndexPath.row)
        
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .Default, title: "Share") { (action: UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .ActionSheet)
            let twitterAction = UIAlertAction(title: "Twitter", style: .Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(cancelAction)
            
            self.presentViewController(shareMenu, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = UIColor.lightGrayColor()
        
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete") { (action: UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            let deleteMenu = UIAlertController(title: nil, message: "Delete cell", preferredStyle: .ActionSheet)
            let deleterAction = UIAlertAction(title: "Delete", style: .Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            deleteMenu.addAction(deleterAction)
            deleteMenu.addAction(cancelAction)
            
            self.presentViewController(deleteMenu, animated: true, completion: nil)
        }
        
        deleteAction.backgroundColor = UIColor.redColor()
        return [shareAction,deleteAction]
    }
    

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
