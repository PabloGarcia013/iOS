//
//  ModelCoches.swift
//  TableLayout3
//
//  Created by CICE on 11/1/16.
//  Copyright © 2016 A.I.Dev. All rights reserved.
//

import UIKit

class ModelCoches: NSObject {
    
    
    //MARK:- VARIABLES
    var name : String!
    var color : String!
    
    //MARK:- INICIALIZADOR
    
    init(name: String, color: String) {
        super.init()
        self.name = name;
        self.color = color;
    }
    
    
}
