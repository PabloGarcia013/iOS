//
//  ICOHTTPClient.swift
//  App_MVC_Complete1
//
//  Created by User on 22/1/16.
//  Copyright © 2016 iCologic. All rights reserved.
//

import UIKit


class ICOHTTPClient {
    
    func getRequest(url: String) -> AnyObject{
        return NSData()
    }
    
    func postRequest(url: String, body: String) -> AnyObject{
        return NSData()
    }
    
    func downloadImage(url: String) -> UIImage{
        

        let aUrl = NSURL(string: url)
        let data = NSData(contentsOfURL: aUrl!)
        let image = UIImage(data: data!)
        return image!
    }
    
    
    
    
}