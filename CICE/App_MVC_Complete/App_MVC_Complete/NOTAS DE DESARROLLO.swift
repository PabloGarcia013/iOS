//
//  NOTAS DE DESARROLLO.swift
//  App_MVC_Complete
//
//  Created by CICE on 27/1/16.
//  Copyright © 2016 CICE. All rights reserved.
//


/*
 FASE 1 DE DESARROLLO

1. Creacion -> Singleton
2. Estructural -> MVC, Decorado, Adaptador, Fachada
3. Comportamiento -> OBservador y memento


Siempre que se crea un proyecto en XCODE se crea con la infaestrcutira necesaria de patrones de Diseño de Apple

1.-> Creamos una clase "CONSERVA" ICOAlbumModel
2. -> Creamos una que "MUESTRA" ICOAlbumView 
    - >dentro creamos dos variables una corresponde a la caratula y otra al activity indicator
    -> necesitamos escribir los inicializadores NSCODER (storyboard lo interprete) inicializador normal

MVC EL REY
1. Modelo :-> la clase que contiene lo datos de la aplicacion y define como manipularlo (ICOAlbumModel)
2. Vista -> representacion visual del modelo y con lo que interactua el usuario (ICOAlbumView)
3. Controlador: -> es la clase mediadora que coordina todo el trabajo, este accede a los datos del modelo y lo muestra de manera sincronizada en la vista, escucha eventos, y manipula los datos segun sea necesario (ICOViewControlLer)

COMO USAR EL PATRON MVC
1. PATRON SINGLETON
    -> garantiza que solo exista "una instancia de una clased determinada" y por lo general utiliza una carga lenta, por lo que solo es necesario utilizarlo una unica vez 




*/