//
//  ICOPersistencyManager.swift
//  App_MVC_Complete
//
//  Created by CICE on 27/1/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class ICOPersistencyManager: NSObject {
    
    
    //MARK: - VARIABLES PRIVADAS
    //declaramos una variable privada no constante lo que permitira agregar o eliminar albumes de musica
    private var albumesDeMusica = [ICOAlbumModel]()
    
    
    override init() {
        
        let album1 = ICOAlbumModel(aTituloAlbum: "Best of Bowie",
            aArtista: "David Bowie",
            aGeneroMusical: "Pop",
            aUrlCaratula: "http://www.andresocampo.com/pruebas/CICE/albumMusic/thebestofbowie.jpg",
            aAnyoDisco: "1992")
        
        let album2 = ICOAlbumModel(aTituloAlbum: "It's my Life",
            aArtista: "No Doubt",
            aGeneroMusical: "Pop",
            aUrlCaratula: "http://www.andresocampo.com/pruebas/CICE/albumMusic/returnofsaturn.jpg",
            aAnyoDisco: "2003")
        
        let album3 = ICOAlbumModel(aTituloAlbum: "Nothing like the sun",
            aArtista: "Sting",
            aGeneroMusical: "Pop",
            aUrlCaratula: "http://www.andresocampo.com/pruebas/CICE/albumMusic/nothinglikethesun.jpg",
            aAnyoDisco: "1999")
        
        let album4 = ICOAlbumModel(aTituloAlbum: "Staring at the Sun",
            aArtista: "U2",
            aGeneroMusical: "Pop",
            aUrlCaratula: "http://www.andresocampo.com/pruebas/CICE/albumMusic/songofascent.jpg",
            aAnyoDisco: "2000")
        
        let album5 = ICOAlbumModel(aTituloAlbum: "American Pie",
            aArtista: "Madonna",
            aGeneroMusical: "Pop",
            aUrlCaratula: "http://www.andresocampo.com/pruebas/CICE/albumMusic/madonnamusicalbum.jpg",
            aAnyoDisco: "2000")
        
        albumesDeMusica = [album1, album2, album3, album4, album5]
        
        
   
        
    }
    
    //MARK: - Debemos añadir 3 funciones que permitiran obtener, añadir y eliminar albumes
    
    func getAlbumesMusicales() -> [ICOAlbumModel]{
        
        return albumesDeMusica
        
    }
    
    func addAlbumesMusicales (album: ICOAlbumModel, indice : Int){
        if albumesDeMusica.count >= indice{
            albumesDeMusica.insert(album, atIndex: indice)
        }else{
            albumesDeMusica.append(album)
        }
    }
    
    func deleteAlbumesMusicales(indice: Int){
        
        albumesDeMusica.removeAtIndex(indice)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
