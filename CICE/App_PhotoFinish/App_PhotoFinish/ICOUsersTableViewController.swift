//
//  ICOUsersTableViewController.swift
//  App_PhotoFinish
//
//  Created by CICE on 7/3/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit
import Parse

class ICOUsersTableViewController: UITableViewController {
    
    // Fase 1 -> Array de usuarios
    var usersParse = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Aquí colocamos el nombre del usuario que ha hecho login.
        self.title = PFUser.currentUser()?.username
        
        // Realizamos la consulta de usuarios de nuestra base de datos.
        let query = PFUser.query()
        // Realizamos la consulta de datos en segundo plano.

        query?.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
            
            // Vaciamos nuestro array de usuarios como codigo defensivo.
            self.usersParse.removeAll()
            
            // Recorremos nuestros objetos.
            for object in objects!{
                // Le decimos que tenemos un usuario  y a ese usuario le tenemos que aclarar que es del tipo PFUser
                let user : PFUser = object as! PFUser
                
                if(user.username != PFUser.currentUser()?.username){
                    self.usersParse.append(user.username!)
                }
            }
            self.tableView.reloadData()
        })
        
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
        return usersParse.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        cell.textLabel?.text = usersParse[indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Aqui cada vez que se pinche en alguna celda queremos colocar un AccesoryType tipo Checkmark
        
        let cell : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        // Comprobamos si esta marcado.
        if cell.accessoryType == UITableViewCellAccessoryType.Checkmark{
            cell.accessoryType = UITableViewCellAccessoryType.None
        
            
            
        }else{
            
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            
            // Aqui debo establecer si estoy "siguiendo a los usuarios"
            
            let following = PFObject(className: "Followers")
            
            // Establecemos sus atributos - > Le digo que followin es justamente el texto de la celda o fila que estamos seleccionando.
            following["following"] = cell.textLabel?.text
            // Y el que sigue siempre voy a ser yo.
            
            following["follower"] = PFUser.currentUser()?.username
            
            // Solo nos falta decirle a parse, este objeto lo guardas en segundo plano.
            following.saveInBackgroundWithBlock(nil)
            
        }
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
