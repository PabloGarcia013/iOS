//
//  Album.swift
//  Obverser_Memento_MyMusic
//
//  Created by CICE on 10/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class Album: NSObject {
    
    var title : String!
    var artist : String!
    var genre : String!
    var coverUrl : String!
    var year : String!
    
    init(title: String, artist: String, genre: String, coverUrl: String, year: String){
        self.title = title
        self.artist = artist
        self.genre = genre
        self.coverUrl = coverUrl
        self.year = year
    }
    
    override var description: String {
        return  "title: \(title)" +
                "artist: \(artist)" +
                "genre: \(genre)" +
                "coverUrl: \(coverUrl)" +
                "year: \(year)"
    }

}
