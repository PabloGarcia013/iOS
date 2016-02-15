//
//  ViewController.swift
//  App_Mapas2
//
//  Created by CICE on 15/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    //MARK: - VARIABLES
    
    var locationManager = CLLocationManager()
    
    //MARK: - IBOULET
    @IBOutlet weak var labelLatitud: UILabel!
    @IBOutlet weak var labelLongitud: UILabel!
    @IBOutlet weak var labelRumbo: UILabel!
    @IBOutlet weak var labelVelocidad: UILabel!
    @IBOutlet weak var labelAltitud: UILabel!
    @IBOutlet weak var labelDireccionCercana: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController : CLLocationManagerDelegate{
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        
        if let userLocation = locations.first{
            labelLatitud.text = "\(userLocation.coordinate.latitude)"
            labelLongitud.text = "\(userLocation.coordinate.longitude)"
            labelRumbo.text = "\(userLocation.course)"
            labelVelocidad.text = "\(userLocation.speed)"
            labelAltitud.text = "\(userLocation.altitude)"
            
            //La geocodificacion inversa es la que damos un punto en la Interfaz y quiero saber que existe en ese punto del mapa.
            CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) -> Void in
                if(error != nil){
                    print(error)
                }else{
                    if let placemarkData = placemarks?[0]{
                        //print(placemarkData.country!)
                        //var direccion = "\(placemarkData.thoroughfare!) \n \(placemarkData.subThoroughfare!)"
                        
                        var direccion = ""
                        
                        /*if placemarkData.thoroughfare != nil{
                            direccion += "\(placemarkData.thoroughfare!)"
                        }else{
                            direccion += ""
                        }*/
                        direccion += self.addInfoIfExists(placemarkData.thoroughfare)
                        direccion += self.addInfoIfExists(placemarkData.subThoroughfare)
                        direccion += self.addInfoIfExists(placemarkData.subAdministrativeArea)
                        direccion += self.addInfoIfExists(placemarkData.country)
                        direccion += self.addInfoIfExists(placemarkData.postalCode)
                        direccion += self.addInfoIfExists(placemarkData.subLocality)
                        direccion += self.addInfoIfExists(placemarkData.locality)
                        direccion += self.addInfoIfExists(placemarkData.ocean)
                        self.labelDireccionCercana.text = direccion
                    }
                }
            })
            
        }
        
    }
    
    func addInfoIfExists(info: String?) -> String{
        if info != nil{
            return "\(info!)\n"
        }else{
            return ""
        }
    }
    
}

