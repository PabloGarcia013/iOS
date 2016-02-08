//
//  ICOAlbumModel.swift
//  App_MVC_Complete
//
//  Created by CICE on 27/1/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class ICOAlbumModel: NSObject {
    
    //MARK: - VARIABLES
    var tituloAlbum: String?
    var artista: String?
    var generoMusical: String?
    var urlCaratula: String?
    var anyoDisco: String?
    
    //INICIALIZADOR O CONSTRUCTOR
    init(aTituloAlbum: String, aArtista: String, aGeneroMusical: String, aUrlCaratula: String, aAnyoDisco: String) {
        
        super.init()
        
        self.tituloAlbum = aTituloAlbum
        self.artista = aArtista
        self.generoMusical = aGeneroMusical
        self.urlCaratula = aUrlCaratula
        self.anyoDisco = aAnyoDisco
        
    }
    
    
    override var description : String{
        
        return "tituloAlbum: \(tituloAlbum)" + "artista: \(artista)" + "generoMusical: \(generoMusical)" + "urlCaratula: \(urlCaratula)" + "AñoDisco: \(anyoDisco)"
  
    }
    
    
    
    

}
