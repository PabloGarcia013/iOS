//
//  ViewController.swift
//  App_Mapas_1
//
//  Created by CICE on 10/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit
import MapKit

//Este framework sirve basicamente para acceder al GPS del dispositivo
import CoreLocation


enum MapType: Int{
    case Standar = 0
    case Hybrid = 1
    case Satellite = 2
}

// La enumeracion Maptip
class ViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES
    var locationManager = CLLocationManager()
    
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myFirstMapMV: MKMapView!
    @IBOutlet weak var mySegmentControl: UISegmentedControl!
    @IBOutlet weak var myLabel: UILabel!
    
    //MARK: - IBACTION
    @IBAction func showMyLocationInMap(sender: AnyObject) {
        
        //Fase 1 -> 
        //Vamos a crearnos un punto en el mapa y le decimos queque sea de nuetro mapa
        let latitud : CLLocationDegrees = 40.433667 // N
        let longitud : CLLocationDegrees = -3.676266 // E
        
        // Cuando usamos la palabra Delta, exactamente nos dice la distancia del campo de vision dentro de nuestro mapa
        let latDelta : CLLocationDegrees = 0.01
        let longDelta : CLLocationDegrees = 0.01
        
        //vamos a definir la localizacion de un punto construyendo un objeto del tipo "CLLocationCoordinate2D"
        let location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitud, longitud)
        
        // es la que me encuentra os valores DELTA (ZOOM)
        let span : MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        //definimos la region que es la que nos pide el punto y el zoom
        let region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        
        myFirstMapMV.setRegion(region, animated: true)
        
        //Añadir una chincheta
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "CICE - Madrid"
        annotation.subtitle = "Hey estamos aqui"
        myFirstMapMV.addAnnotation(annotation)
    }
    
    @IBAction func showMap(sender: AnyObject) {
        let mapType = MapType(rawValue: mySegmentControl.selectedSegmentIndex)
        switch mapType!{
            case .Standar:
                myFirstMapMV.mapType = MKMapType.Standard
            case .Hybrid:
                myFirstMapMV.mapType = MKMapType.Hybrid
            case .Satellite:
                myFirstMapMV.mapType = MKMapType.Satellite
            break
        }
    }
    
    //MARK: - UTILS
    
    func actionGestureRecognizwerLongPressOnClick(gestureRecognizer: UIGestureRecognizer){
        
        if gestureRecognizer.state = UIGestureRecognizerState.Recognized{
            
            //Punto de toque es decir el parametro de medida en que parte de mi interfaz se ha pulsado con el dedo y ademas con una espera maxima de 2 segundos
            let touchePoint = gestureRecognizer.locationInView(myFirstMapMV)
        
            //este objeto es del tipo CLLocationCoordinate2D, tiene metodos, inicilizadores, funcones
        
            let newCoordinate : CLLocationCoordinate2D = myFirstMapMV.convertPoint(touchePoint, toCoordinateFromView: myFirstMapMV)
        
            let annotation = MKPointAnnotation()
            annotation.coordinate = newCoordinate
            annotation.title = "Hey soy un nuevo titulo"
            annotation.subtitle = "Estamos en clase :)"
        
            myFirstMapMV.addAnnotation(annotation)
        
        }
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Gesto del Dedo (pulsacion larga / LongPress de Android)
        let longPressGestureRecognizerOnClickMapView = UILongPressGestureRecognizer(target: self, action: "actionGestureRecognizwerLongPressOnClick:")
        longPressGestureRecognizerOnClickMapView.minimumPressDuration = 2
        myFirstMapMV.addGestureRecognizer(longPressGestureRecognizerOnClickMapView)
        
        //Solicita al Usuario acceder a su posicion
        //Info.plist -> NSLocationWhenInUseUsageDescription
        //NSLocationAlwaysUsageDescription
        //fase de precision
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
                
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : CLLocationManagerDelegate{
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //let userLocation  = locations[0]
        let userLocation = locations.first! as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        myFirstMapMV.setRegion(region, animated: true)
        

        let point : MKPointAnnotation! = MKPointAnnotation()
        point.coordinate = userLocation.coordinate
        point.title = "nueva etiqueta"
        point.subtitle = "Estamos aqui"
        
        myFirstMapMV.addAnnotation(point)
        

    }
    
}
























