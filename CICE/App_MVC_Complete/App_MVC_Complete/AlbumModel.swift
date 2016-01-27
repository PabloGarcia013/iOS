//
//  AlbumModel.swift
//  App_MVC_Complete
//
//  Created by Pablo Garcia on 27/1/16.
//  Copyright © 2016 Pablo Garcia. All rights reserved.
//

import UIKit

class AlbumModel: NSObject {
    
    //MARK: - VARIABLES
    
    var tituloAlbum : String?
    var artista : String?
    var generoMusica : String?
    var urlCaratula : String?
    var anioDisco : String?
    
    init(tituloAlbum : String, artista : String, generoMusica : String, urlCaratula : String, anioDisco : String){
        
        super.init()
        
        self.tituloAlbum = tituloAlbum;
        self.artista = artista;
        self.generoMusica = generoMusica;
        self.urlCaratula = urlCaratula;
        self.anioDisco = anioDisco;
    }
}
