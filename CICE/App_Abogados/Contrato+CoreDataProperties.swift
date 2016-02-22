//
//  Contrato+CoreDataProperties.swift
//  App_Abogados
//
//  Created by CICE on 22/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Contrato {

    @NSManaged var diaFecha: String?
    @NSManaged var mesFecha: String?
    @NSManaged var nombreYApellido: String?
    @NSManaged var nombreEmpresa: String?
    @NSManaged var direccionEmpresa: String?
    @NSManaged var despachoAbogados: String?
    @NSManaged var colegiado1: String?
    @NSManaged var colegiado2: String?
    @NSManaged var observacionesGenerales: String?
    @NSManaged var cuentaBancaria: String?
    @NSManaged var titularCuenta: String?

}
