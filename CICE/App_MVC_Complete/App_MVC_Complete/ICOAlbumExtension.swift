//
//  ICOAlbumExtension.swift
//  App_MVC_Complete
//
//  Created by CICE on 1/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import Foundation

extension ICOAlbumModel{
    func icoae_tableRepresentation() -> (titulos:[String], valores:[String]){
        return (["Artista", "Album Musical", "Genero", "Año"], [artista!, tituloAlbum!, generoMusical!, anyoDisco!])
    }
    
}
