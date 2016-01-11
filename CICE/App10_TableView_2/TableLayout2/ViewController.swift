//
//  ViewController.swift
//  TableLayout2
//
//  Created by CICE on 11/1/16.
//  Copyright © 2016 A.I.Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- IBOULET
    
    @IBOutlet weak var myTableView: UITableView!
    
    //MARK:- VARIABLES LOCALES
    
    let myArray = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"]

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

extension ViewController : UITableViewDataSource{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return myArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : UITableViewCell = myTableView.dequeueReusableCellWithIdentifier("Cell")!
        cell.textLabel?.text = myArray[indexPath.row]
        
        return cell
    }
    
    
    
}

extension ViewController : UITableViewDelegate{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(myArray[indexPath.row])
    }
}

