//
//  ICOClientesTableViewController.swift
//  App_Abogados
//
//  Created by CICE on 24/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit
import CoreData

class ICOClientesTableViewController: UITableViewController {
    
    var fetchContratosArray = []
    var manageObjectContext : NSManagedObjectContext?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Fase 1.
        
        let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Fase 2.
        
        manageObjectContext = appDelegate.managedObjectContext
        
        // Fase 3.
        
        fetchContratosArray = getAllDataContratosArray()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func getAllDataContratosArray() -> NSArray{
        // solicitamos la recuperacion de datos.
        
        let fecthRequest = NSFetchRequest()
        
        // Establecemos la nentrada general a la base de datos.
        let entity : NSEntityDescription = NSEntityDescription.entityForName("Contrato", inManagedObjectContext: manageObjectContext!)!
        
        // definimos de que entidad debe obtener los datos solicitados
        fecthRequest.entity = entity
        
        let fetchContratosArrayData : NSArray?
        do{
            fetchContratosArrayData = try! manageObjectContext?.executeFetchRequest(fecthRequest)
        }catch let error{
            print(error)
        }
        
        return fetchContratosArrayData!
        
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
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
        return fetchContratosArray.count
    }
    
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let contratos : Contrato = fetchContratosArray[indexPath.row] as! Contrato
        
        cell.textLabel?.text = NSString(format: "Nombre Cliente: %@ Empresa : %@",contratos.nombreYApellido!, contratos.nombreEmpresa!) as String
        
        cell.detailTextLabel?.text = NSString(format: "Fecha: %@ de %@ - 2016", contratos.diaFecha! ,contratos.mesFecha!) as String

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let icoDetailVC : ICODetailViewController = self.storyboard?.instantiateViewControllerWithIdentifier("IcoDetailContratos") as! ICODetailViewController
        
        icoDetailVC.selectContratosDataBase = fetchContratosArray.objectAtIndex(indexPath.row) as! Contrato
        
        self.navigationController?.pushViewController(icoDetailVC, animated: true)
        
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
