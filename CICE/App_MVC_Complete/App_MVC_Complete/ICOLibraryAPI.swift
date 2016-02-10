//
//  ICOLibraryAPI.swift
//  App_MVC_Complete
//
//  Created by CICE on 27/1/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class ICOLibraryAPI: NSObject {
    
    //MARK: - VARIABLES
    private let persistanceManager : ICOPersistencyManager
    private let httpClient : ICOHTTPClient
    private let isOnline : Bool
    
    
    override init() {
        persistanceManager = ICOPersistencyManager() //alloc init
        httpClient = ICOHTTPClient() //alloc init
        isOnline = false
        super.init()
        
        
        //=====================**************==================//
        //PATRON NOTIFICACION
        
        //en este otro lado de la ecuacion "OBSERVADOR" es el recibe -> cada vez que ICOAlbumView notifique un mensaje "ICODescargaImagenesNotificacion" una vez dado de alta ICOLibraryAPI como observador de dicha notificacion, nos permite enviarle un selector, "descargaDeImagenes" en respuesta
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "descargaDeImagenes:",
            name: "ICODescargaImagenesNotificacion",
            object: nil)
    }
    
    
    //MARK: - UTILS
    
    //=====================**************==================//
    //PATRON NOTIFICACION
    //darse de baja de manera obligatoria
    
    deinit{
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    func descargaDeImagenes(notification:NSNotification){
        
        // 1 -> esta funcion
        
        let userInfo = notification.userInfo as! [String: AnyObject]
        let imageView = userInfo["imageView"] as! UIImageView?
        let urlCaratula = userInfo["urlCaratula"] as! String
        
        if let imageViewDesempaquetada = imageView{
            imageViewDesempaquetada.image = persistanceManager.getImagenSalvadaLocalmente(urlCaratula.lastPathComponent)
            
            if imageViewDesempaquetada.image == nil{
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
                    let imagenDescargada = self.httpClient.downloadImage(urlCaratula as String)
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        imageViewDesempaquetada.image = imagenDescargada
                        self.persistanceManager.salvarLocalmenteImagenes(imagenDescargada, fileName: urlCaratula.lastPathComponent)
                    })
                    
                })
            }
        }
        
        
        
    }
    

    //MARK: - SINGLETON
    //1 -> Creamos una variable de clase
    class var sharedInstance: ICOLibraryAPI {
        
        //2 -> Anidamos dentro de nuestra variable de clase una estructura llamada Singleton
        struct Singleton {
            
            //3 -> envuelve una varibale estatica, esto quiere dcir que esta contante solo existe una vez y son implicitamente perezosos, lo que concluye que no se crea sino hasta que es necesario, 
            static let instance = ICOLibraryAPI()
        }
        
        return Singleton.instance
   
    }
    
    
    //MARK: - METODOS DE PERSISTANCYMANAGER
    
    func getAlbumesMusicales() -> [ICOAlbumModel]{
        
        return persistanceManager.getAlbumesMusicales()
    }
    
    
    func addAlbumesMusicales(album: ICOAlbumModel, indice: Int){
        
        persistanceManager.addAlbumesMusicales(album, indice: indice)
        
        if isOnline{
            
            httpClient.postRequest("/api/addAlbumesMusicales", body: album.description)
        }
        
    }
    
    func deleteAlbumesMusicales (indice: Int){
        
        persistanceManager.deleteAlbumesMusicales(indice)
        
        if isOnline{
            
            httpClient.postRequest("/api/deletAlbumesMusicales", body: "\(indice)")
        }
        
    }
 
}

extension String{
    var lastPathComponent : String{
        get{
            return (self as NSString).lastPathComponent
        }
    }
}