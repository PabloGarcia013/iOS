//
//  AppDelegate.swift
//  App_Listado_de_tareas
//
//  Created by CICE on 18/1/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Override point for customization after application launch.
       customizerNavigationBar()
        
        if(UIApplication.instancesRespondToSelector("registerUserNotificationSettings:")){
            let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge,.Sound], categories: nil)
            UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        }
        
        return true
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        
        NSUserDefaults.standardUserDefaults().setObject(listadoTareas, forKey: "listadoTareas")
        NSUserDefaults.standardUserDefaults().setObject(listadoDescripcion, forKey: "listadoDescripcion")
        NSUserDefaults.standardUserDefaults().setObject(listadoPrioridad, forKey: "listadoPrioridad")
        NSUserDefaults.standardUserDefaults().setObject(listadoFotos, forKey: "listadoFotos")
        
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    
    //MARK: - NOTIFICACION LOCAL
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {

    }
    
    func customizerNavigationBar(){
        let shadow = NSShadow()
        shadow.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)
        shadow.shadowOffset = CGSizeMake(0.0, 1.0)
        
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSShadowAttributeName: shadow]
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "nav_bar@2x.png"), forBarMetrics: .Default)
    }
}

