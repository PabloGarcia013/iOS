//
//  NotificacionManager.swift
//  App_Listado_de_tareas
//
//  Created by CICE on 22/1/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class NotificacionManager: NSObject {
    
    func sendNotification(message: String , time: NSTimeInterval){
       
        let localNotification = UILocalNotification()
        
        localNotification.fireDate = NSDate(timeIntervalSinceNow: time)
        localNotification.alertBody = message
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber+1
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    
    

}
