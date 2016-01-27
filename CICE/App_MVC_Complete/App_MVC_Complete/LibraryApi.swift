//
//  LibraryApi.swift
//  App_MVC_Complete
//
//  Created by Pablo Garcia on 27/1/16.
//  Copyright © 2016 Pablo Garcia. All rights reserved.
//

import UIKit

class LibraryApi: NSObject {
    
    //MARK: - SINGLETON
    //1 Creamos una variable de clase.
    class var sharedInstance: LibraryApi{
        //2 Anidamos dentro de nuestra variable de clase una estructura llamada Singleton.
        struct Singleton{
            //3 Esto envuelve una variable estica, esto quiere decir que esta constante solo existe una vez y son implicitamente perezosos, lo que concluye que no se crea sino hasta que es necesario.
            static let instance = LibraryApi()
        }
        
        return Singleton.instance
    }

}
