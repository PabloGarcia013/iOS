//
//  ICOHorizontalScroller.swift
//  App_MVC_Complete
//
//  Created by CICE on 3/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

//MARK: - PROTOCOLO DELEGADO PROPIO
// con la palabra  reservada "protocol" definimos los metodos que se usaran posteriormente en la vista controlador

protocol ICOHorizontalScrollerDelegate{
    
    //1 -> pedimos al DELEGADO el numero de elementos que se quieren presentar en la vista
    func numeroVistasEnHorizontalScroller(scroller: ICOHorizontalScroller) -> Int
    
    //2 -> pedimos al DELEGADO el objeto que debe aparecer segun el indice
    func vistaPorIndiceEnHorizontalScroller(scroller: ICOHorizontalScroller, indice: Int) -> UIView
    
    //3 -> informar al DELEGADO cuando se ha hecho un click en la vista
    func clickEnAlgunaVistaPorIndiceEnHorizontalScroller(scroller: ICOHorizontalScroller, indice: Int)
    
    //4 -> pedimos al DELEGADO nos muestre la vista inicial del indice (0)
    func vistaInicialPorIndice(scroller: ICOHorizontalScroller) -> Int
    
  
}

class ICOHorizontalScroller: UIView {
    
    
    //MARK: - VARIABLE DELEGADO
    //1 -> Delegado
    var icoDelegate : ICOHorizontalScrollerDelegate?
    
    //MARK: - CONSTANTES
    //2 -> definimos constantes para que sea mas facil modificar el diseño,
    private let VIEW_PADDING = 10
    private let VIEW_DIMENSION = 100
    private let VIEW_OFF_SET = 100
    
    private var desplazador : UIScrollView!
    
    
    //3 -> creamos una coleccion que contendra todas las portadasde las vistas
    var miArrayDeVistas = [UIView]() //alloc init
    
    //4 -> inicializador de la clse abstracta
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        inicializaScrollView()
    }
    
    
    //MARK: - UTILS
    func inicializaScrollView(){
        
        //1 -> construimos un nuevo ScrollView y lo añadimos a la vista padre
        desplazador = UIScrollView() // alloc init
        addSubview(desplazador)
        
        //2 -> apagamos eltamaño automatico de la mascara, para poder nosotros, controlar nuestras priopias limitaciones
        desplazador.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraint(NSLayoutConstraint(item: desplazador,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Leading,
            multiplier: 1.0,
            constant: 0.0))
        
        self.addConstraint(NSLayoutConstraint(item: desplazador,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Trailing,
            multiplier: 1.0,
            constant: 0.0))
        
        self.addConstraint(NSLayoutConstraint(item: desplazador,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0.0))
        
        self.addConstraint(NSLayoutConstraint(item: desplazador,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0.0))
        
        
        //3 -> creamos un gesto de reconocimiento, entiende los toques en la pantalla de ka vosta srcoller o desplazador
        
        let gestoDeReconocimiento = UITapGestureRecognizer(target: self, action: "desplazadorTocado:")
        desplazador.addGestureRecognizer(gestoDeReconocimiento)
        
        
        desplazador.delegate = self
    
    }
    
    func desplazadorTocado(reconocimientoGesto: UITapGestureRecognizer){

        //1 -> devolver el calculo de la ubicacion en la vista determinada
        let ubicacion = reconocimientoGesto.locationInView(reconocimientoGesto.view)
        
        if let delegado = icoDelegate{
            
            //2-> invocamos el numero de vistas en el scroller en el delegado
            for indice in 0..<delegado.numeroVistasEnHorizontalScroller(self){
                
                //añadimos la vista en nuestro desplazador
                let viewData = desplazador.subviews[indice]
                
                //comprobacion de si es exitoso el Gesto o si se ha encontrado algo en el instante que se ha pulsado en la pantalla (imagen)
                if CGRectContainsPoint(viewData.frame, ubicacion){
                    
                    delegado.clickEnAlgunaVistaPorIndiceEnHorizontalScroller(self, indice: indice)
                    
                    // centramos la vista en el scrollView
                    desplazador.setContentOffset(CGPoint(x: viewData.frame.origin.x - self.frame.size.width / 2 + viewData.frame.size.width / 2 , y: 0), animated: true)
                    
  
                }
            }
        }
    }
    
    
    //agregamosm la siguiente funcion, para acceder a la caratula del Album de nuestro carrusel de imagenes, que estan piuestas en el scrollView o desplazador, este simeplemente no devuelve la vista a un indice determinado
    func vistaDelIndiceDelObjeto(indice: Int) -> UIView{
        if indice < miArrayDeVistas.count{
            return miArrayDeVistas[indice]
        }else{
            let lastElement = miArrayDeVistas.count - 1
            return miArrayDeVistas[lastElement]
        }
        
        
    }
    
    //debemos  recargar nuestro carrusel de imagenes (myTableView.reloadData)
    func recargaDatosDelHorizontalScroller(){
        
        
        //1 -> comprobamos si hay algun delegado antes de realizar ninguna carga
        if let delegado = icoDelegate{
            
            //2-> puesto que estsmoa limpiando las portadas de los discos, tambien es neceario restablecer el array, sino tenemos un monton de vistas que se acumulan
            miArrayDeVistas = []
            let vistas : NSArray = desplazador.subviews
            
            // 3 -> retiramos todas las subvistas previamnete añadiendo la vista del desplazador
            for vista in vistas{
                vista.removeFromSuperview()
            }
            
            //4 -> valorX es el punto de partida de las vistas en el interior del desplazador
            var valorX = VIEW_OFF_SET
            
            for indice in 0..<delegado.numeroVistasEnHorizontalScroller(self){
                
                //5 -> el horizontal scroller pide al delegado la vista de uno en uno y el objetivo es que lo ponga uno al lado del otro
                
                valorX += VIEW_PADDING
                
                let vista = delegado.vistaPorIndiceEnHorizontalScroller(self, indice: indice)
                vista.frame = CGRectMake(CGFloat(valorX), CGFloat(VIEW_PADDING), CGFloat(VIEW_DIMENSION), CGFloat(VIEW_DIMENSION))
                desplazador.addSubview(vista)
                
                //6 -> guardamos la vista en el array para hacer un seguimiento de todas las vistas en la vista de plaza,miento
                miArrayDeVistas.append(vista)
                
                valorX += VIEW_OFF_SET + VIEW_PADDING
                
                desplazador.contentSize = CGSizeMake(CGFloat(valorX + self.VIEW_OFF_SET), frame.size.height)
                
                //8 -> el horizontal Scroller comprueba si su delegado implementa "vistaInicialPorIndice"
                if let vistaInicial = icoDelegate?.vistaInicialPorIndice(self){
                    desplazador.setContentOffset(CGPoint(x: CGFloat(vistaInicial), y: 0), animated: true)
                }
            }
        }
    }
    
    //Cuando los datos hayan cambiado se llama a auna vista cuando se añade a otra como una subvista
    override func didMoveToSuperview() {
        
        recargaDatosDelHorizontalScroller()
    }
    
    
    func centrarVistaActualAlbumMusical(){
        
        
        var puntoCentral = Int(desplazador.contentOffset.x) + VIEW_OFF_SET / 2
        
        let vistaIndice = puntoCentral / (VIEW_OFF_SET + (2 * VIEW_PADDING))
        
        puntoCentral = vistaIndice * (VIEW_OFF_SET + (2 * VIEW_PADDING))
        
        desplazador.setContentOffset(CGPoint(x: puntoCentral, y: 0), animated: true)
        
        if let delegate = icoDelegate{
            delegate.clickEnAlgunaVistaPorIndiceEnHorizontalScroller(self, indice: Int(vistaIndice))
        }
    }
   
}




extension ICOHorizontalScroller : UIScrollViewDelegate{
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        centrarVistaActualAlbumMusical()
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        centrarVistaActualAlbumMusical()
    }
    
    
}











