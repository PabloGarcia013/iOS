//
//  AlbumExtensions.swift
//  Obverser_Memento_MyMusic
//
//  Created by CICE on 10/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import Foundation


extension Album {
    func ae_tableRepresentation() -> (titles:[String], values:[String]) {
        return (["Artist", "Album", "Genre", "Year"], [artist, title, genre, year])
    }
}