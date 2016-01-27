//
//  AlbumView.swift
//  App_MVC_Complete
//
//  Created by Pablo Garcia on 27/1/16.
//  Copyright © 2016 Pablo Garcia. All rights reserved.
//

import UIKit

class AlbumView: UIView {

    // Añadimos variables privadas.
    
    //MARK: - VARIABLES PRIVADAS.
    
    //Caratula del album.
    private var caratulaAlbumFinal : UIImageView?
    
    //Indica el proceso de carga de la imagen.
    private var activityIndicador : UIActivityIndicatorView?
    
    //MARK: - INIT 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.inicializadorComun()
    }
    
    init(frame: CGRect, caratulaAlbumFinal : String) {
        super.init(frame: frame)
        
        self.inicializadorComun()
    }
    
    func inicializadorComun(){
        self.backgroundColor = UIColor.redColor()
        
        caratulaAlbumFinal = UIImageView(frame: CGRectMake(5, 5, frame.size.width - 10, frame.size.height - 10))
        self.addSubview(caratulaAlbumFinal!)
        
        activityIndicador = UIActivityIndicatorView(frame: CGRect())
        activityIndicador?.center = center
        activityIndicador?.activityIndicatorViewStyle = .Gray
        activityIndicador?.startAnimating()
        
        self.addSubview(activityIndicador!)
    }
    
    func highLightAlbum(didHighLightView view : Bool){
        if(view){
            
            self.backgroundColor = UIColor.whiteColor()
            
        }else{
            
            self.backgroundColor = UIColor.blackColor()
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
