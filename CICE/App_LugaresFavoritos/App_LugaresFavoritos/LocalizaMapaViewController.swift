//
//  LocalizaMapaViewController.swift
//  App_LugaresFavoritos
//
//  Created by CICE on 17/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit
import MapKit

class LocalizaMapaViewController: UIViewController {

    
    //MARK: - VARIABLES LOCALES
    let locationManager = CLLocationManager()
    var permitirCreacion = false
    
    //MARK: - IBOULET
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if lugarActivo == -1{
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            permitirCreacion = true
        }
        else{
            permitirCreacion = false
            let latitud = NSString(string:lugaresGuardados[lugarActivo]["lat"]!).doubleValue
            let longitud = NSString(string: lugaresGuardados[lugarActivo]["long"]!).doubleValue
            let center = CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
            mapView.setRegion(region, animated: true)
            self.setAnnotation(center, title: lugaresGuardados[lugarActivo]["name"]!, subtitle: lugaresGuardados[lugarActivo]["subtitle"]!)
        }
        
        if(permitirCreacion){
            let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: "vistaDeMapaPresionado:")
            gestureRecognizer.minimumPressDuration = 1
            mapView.addGestureRecognizer(gestureRecognizer)
        }
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - UTILS
    
    func vistaDeMapaPresionado(gestureRecognizer : UIGestureRecognizer){
        
            if gestureRecognizer.state == UIGestureRecognizerState.Recognized{
                
                let touchPoint = gestureRecognizer.locationInView(mapView)
                let newCoordinate = mapView.convertPoint(touchPoint, toCoordinateFromView: mapView)
                
                // La clase GLGeocoder necesita un objeto del tipo CLLocation por lo que no nos vale la variable newCoordinate por que es del tipo CLLocationCoordinate2D
                let locationData = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
                
                // Creamos la instancia de CLGeocoder // 2º Plano
                CLGeocoder().reverseGeocodeLocation(locationData, completionHandler: { (placemarks, error) -> Void in
                    
                    var newTitle = ""
                    var newSubtitle = ""
                    
                    if let placemarkData = placemarks?.first{
                        if placemarkData.thoroughfare != nil{
                            newTitle += "\(placemarkData.thoroughfare!)"
                        }
                        
                        if placemarkData.subThoroughfare != nil{
                            newSubtitle += "\(placemarkData.subThoroughfare!)"
                        }
                        if newTitle == ""{
                            newTitle = "Hoops! creo que no existe"
                        }
                        if newSubtitle == ""{
                            newSubtitle = "Punto añadido el \(NSDate())"
                        }
                        
                        self.setAnnotation(newCoordinate, title: newTitle, subtitle: newSubtitle)
                        
                        lugaresGuardados.append(["name": newTitle, "subtitle" : newSubtitle, "lat" : "\(newCoordinate.latitude)", "long": "\(newCoordinate.longitude)"])
                    }
                })
                
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setAnnotation(coordinate : CLLocationCoordinate2D, title : String, subtitle : String){
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = title
        annotation.subtitle = subtitle
        
        mapView.addAnnotation(annotation)
    }
    
}

extension LocalizaMapaViewController : CLLocationManagerDelegate{
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if let userLocation = locations.first{
            let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
            mapView.setRegion(region, animated: true)
        }
        
    }
}
