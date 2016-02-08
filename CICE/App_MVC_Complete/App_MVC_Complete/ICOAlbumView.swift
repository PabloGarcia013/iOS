//
//  ICOAlbumView.swift
//  App_MVC_Complete
//
//  Created by CICE on 27/1/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class ICOAlbumView: UIView {

    
    //Añadimos variables privadas para que nadie fuera de esta calse las vea, ni sepa de su existencia
    
    //MARK: - VARIABLES PRIVADAS
    //Caratula del Album que repesentara la portada
    private var caratulaAlbumFinal : UIImageView?
    //Activity indicator que representa el proceso de carga de la imagen
    private var activityIndicador : UIActivityIndicatorView?
    
    
    //MARK: - INIT
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        inizializadorComun()
        
    }
    
    init(frame: CGRect, caratulaAlbum:String) {
        super.init(frame: frame)
        inizializadorComun()
        
        
        //=====================**************==================//
        //PATRON NOTIFICACION
        //es un patron de subscripcion o publicacion que permite que un objeto (remitente) envie mensajes a otros objetos (receptores)
        //las notificaciones son muy usadas dentro de Apple, por ejemplo cunado se muestra el teclado UIApplication
        //la descarga de las imagenes debe realizarla ICOLibraryAPI
        NSNotificationCenter.defaultCenter().postNotificationName("ICODescargaImagenesNotificacion",
            object: self,
            userInfo: ["imageView": caratulaAlbumFinal!, "urlCaratula": caratulaAlbum])
        
        
        //=====================**************==================//
        
        
    }
    
    //MARK: - UTILS
    func inizializadorComun(){
        
        backgroundColor = UIColor.blackColor()
        caratulaAlbumFinal = UIImageView(frame: CGRectMake(5, 5, frame.size.width - 10, frame.size.height - 10))
        addSubview(caratulaAlbumFinal!)
        
        
        activityIndicador = UIActivityIndicatorView()
        activityIndicador?.center = center
        activityIndicador?.activityIndicatorViewStyle = .Gray
        activityIndicador?.startAnimating()
        addSubview(activityIndicador!)
        
   
    }
    
    
    func highLightAlbum (didHighLightView view: Bool){
        
        if view{
            
            backgroundColor = UIColor.whiteColor()
            
        }else{
        
            backgroundColor = UIColor.blackColor()
        }
        
    }
    

}












