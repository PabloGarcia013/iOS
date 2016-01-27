//
//  PercsistencyManager.swift
//  App_MVC_Complete
//
//  Created by Pablo Garcia on 27/1/16.
//  Copyright © 2016 Pablo Garcia. All rights reserved.
//

import UIKit

class PercsistencyManager: NSObject {

    
    //MARK:- VARIABLES LOCALES
    
    private var albunesMusica = [AlbumModel]()
    
    override init(){
        let album1 = AlbumModel(tituloAlbum: "", artista: "", generoMusica: "", urlCaratula: "", anioDisco: "")
    }
    
}
