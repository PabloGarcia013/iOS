//
//  ModelCoches.swift
//  TableViewCoches
//
//  Created by CICE on 11/1/16.
//  Copyright © 2016 A.I.Dev. All rights reserved.
//

import UIKit

class ModelCoches: NSObject {

    var name : String!
    var color : String!
    
    init(name : String, color :  String) {
        super.init()
        self.name = name
        self.color = color
    }
    
}
