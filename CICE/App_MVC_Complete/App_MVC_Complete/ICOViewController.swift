//
//  ICOViewController.swift
//  App_MVC_Complete
//
//  Created by CICE on 27/1/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class ICOViewController: UIViewController {
    
    //1
    //MARK: - VARIABLES LOCALES
    private var allAlbumesMusicales = [ICOAlbumModel]()
    private var currentAlbumMusicalData : (titulos:[String], valores:[String])?
    private var indiceAlbumActual = 0
    
    //1.1
    //MARK: - IBOUTLET
    @IBOutlet weak var myTableViewVC: UITableView!
    @IBOutlet weak var myToolBarVC: UIToolbar!
    @IBOutlet weak var miPropioDesplazadorHorizontal: ICOHorizontalScroller!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //2 -> hacer opaco nuestra barra de navegacion
        navigationController?.navigationBar.translucent = false
        //2.1
        indiceAlbumActual = 0
        
        //2.2 -> SINGLETON
        allAlbumesMusicales = ICOLibraryAPI.sharedInstance.getAlbumesMusicales()
        
        //2.3 -> DELEGACION / DATA SOURCE
        myTableViewVC.delegate = self
        myTableViewVC.dataSource = self
        
        
        miPropioDesplazadorHorizontal.icoDelegate = self
        
        showDataForAlbumesMusicales(indiceAlbumActual)
        recargarScrollHorizontal()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - UTILS
    func showDataForAlbumesMusicales(albumMusical: Int){
        //1.Codigo defensivo es importante segurarnos que el indice solicitado es inferior a la cantidad de Albumes
        if albumMusical < allAlbumesMusicales.count && albumMusical > -1{
            //2 -> traemos el albumMisical
            let albumData = allAlbumesMusicales[albumMusical]
            //3 -> guarda los datos de albumes para representarlos posteriormente en la TableView
            currentAlbumMusicalData = albumData.icoae_tableRepresentation()
        }else{
            currentAlbumMusicalData = nil
        }
        myTableViewVC.reloadData()
    }
    
    func recargarScrollHorizontal(){
        
        allAlbumesMusicales = ICOLibraryAPI.sharedInstance.getAlbumesMusicales()
        if indiceAlbumActual < 0 || indiceAlbumActual >= allAlbumesMusicales.count{
            indiceAlbumActual = allAlbumesMusicales.count
        }
        
        miPropioDesplazadorHorizontal.recargaDatosDelHorizontalScroller()
        showDataForAlbumesMusicales(indiceAlbumActual)
        
    }
    
    
}

//MARK : - EXTENSION DATA SOURCE / DELEGATE

extension ICOViewController : UITableViewDelegate{
    
    
}


extension ICOViewController : UITableViewDataSource{
    
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let albumData = currentAlbumMusicalData{
            
            return albumData.titulos.count
            
        }else{
            return 0
        }
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        /*
        let albumData = currentAlbumMusicalData
        
        cell.textLabel?.text = albumData!.titulos[indexPath.row]
        cell.detailTextLabel?.text = albumData!.valores[indexPath.row]
        */
        
        if let albumData = currentAlbumMusicalData{
            
            cell.textLabel?.text = albumData.titulos[indexPath.row]
            cell.detailTextLabel?.text = albumData.valores[indexPath.row]
        }
        
        return cell
        
    }
    
}


//MARK: - EXTENSION HORIZONTAL SCROLLER DELEGATE



extension ICOViewController : ICOHorizontalScrollerDelegate{
    
    
    func numeroVistasEnHorizontalScroller(scroller: ICOHorizontalScroller) -> Int {
        
        return allAlbumesMusicales.count
        
    }
    
    func vistaPorIndiceEnHorizontalScroller(scroller: ICOHorizontalScroller, indice: Int) -> UIView {
        
        //1 -> primero cogemos el album misical del indice
        let albumMusical = allAlbumesMusicales[indice]
        
        let vistaAlbumMusical = ICOAlbumView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), caratulaAlbum: albumMusical.urlCaratula!)
        
        if indiceAlbumActual == indice{
            
            vistaAlbumMusical.highLightAlbum(didHighLightView: true)
            
        }else{
            vistaAlbumMusical.highLightAlbum(didHighLightView: false)
        }
        
        return vistaAlbumMusical
    }
    
    
    func clickEnAlgunaVistaPorIndiceEnHorizontalScroller(scroller: ICOHorizontalScroller, indice: Int) {
        
        let vistaAlbumActualMusicalPrevio = scroller.vistaDelIndiceDelObjeto(indiceAlbumActual) as! ICOAlbumView
        vistaAlbumActualMusicalPrevio.highLightAlbum(didHighLightView: false)
        
        indiceAlbumActual = indice
        
        let vistaAlbumMusicalSeleccionado = scroller.vistaDelIndiceDelObjeto(indiceAlbumActual) as! ICOAlbumView
        vistaAlbumMusicalSeleccionado.highLightAlbum(didHighLightView: true)
        
        showDataForAlbumesMusicales(indice)
        
        
    }
    
    func vistaInicialPorIndice(scroller: ICOHorizontalScroller) -> Int {
        
         return indiceAlbumActual
    }
    
    
}


























