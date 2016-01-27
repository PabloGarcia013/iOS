//
//  NotasDesarrollo.swift
//  App_MVC_Complete
//
//  Created by Pablo Garcia on 27/1/16.
//  Copyright © 2016 Pablo Garcia. All rights reserved.
//
/*

Fase 1 de desarrollo.

1. Creacion -> Singleton
2. Estructural -> MCV, Decorado, Adaptador, Fachada
3. Comportamiento -> Observador, Memento.

Siempre que se crea un proyecto en XCODE se crea con la infraestructura necesaria de los patrones de diseño de apple.

1.-> Creamos una clase que conserva datos. AlbumModel
2.-> Creamos una clase que muestra datos. AlbumView
    -> dentro creamos 2 variables. Una corresponde a la caratula y otra al activity indicator.
    -> necesitamos escribir los inicializadores NSCoder para que el storyboard lo interprete y un inicializador normal

MVC El rey
1. Modelo: La clase que contiene los datos de la aplicacion y define como manipularlo (AlbumModel)
2. Vista: Representacion visual del modelo y con los que interactua el usuario (AlbumView)
3. Controlador: Es la clase mediadora que coordina todo el trabajo. Accede a los datos del modelo y lo muestra de manera sincronizada en la vista, escucha eventos y manipula datos segun sea necesario. (View Controller)

Como usar el patron MVC:
1. Patron Singleton
    -> Garantiza que solo exista una instancia de una determinada clase y por lo general utiliza una carga lenta. Por lo que solo es necesario utilizarlo una sola vez.


*/
