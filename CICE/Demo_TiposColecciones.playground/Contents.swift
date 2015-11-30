//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Array con inferencia de tipos.
let iPhones = ["iPhone6","iPhone6+","iPhone5","iPhone5s","iPhone5c","iPhone4s"]
let iPads = ["iPad Air","iPad Mini","iPad Retina","iPad Pro"]

// Anexar un array a otro del mismo tipo.
var iDevices = iPhones + iPads

// Añadir a un array
iDevices.append("Mac Book")

// Insertar/Añadir a un array
iDevices.insert("Mac Mini", atIndex: 1)

// Ordenar con < > el array
iDevices.sort(>)

// Remover del array.
iDevices.removeAtIndex(0)

// Asignar el valor de la posición 2
let iPhone5s = iDevices[2]

// Asignar el ultimo valor
let lastOne = iDevices.last

// Recorrerse el array y printarlo.
for iDevice in iDevices{
    print(iDevices)
}

// Array con definición de tipos.
var myEnteros: [Int] = [1,2,3,4,5,6]

myEnteros.sort(<)

myEnteros.removeAtIndex(0)

for myEnterosAux in myEnteros{
    print(myEnterosAux)
}

/********* Diccionarios *************/

// Aqui estoy declarando que voy a tener una variable 'coches' que es un diccionario con el key: valor -> String: String (key es del tipo string y valor es del tipo string).
var coches: [String: String] = Dictionary()
var otrosCoches = ["marca":"Renault", "modelo":"Megane", "caballos": "145"]

let marca = otrosCoches["marca"]
otrosCoches["años"] = "10"

otrosCoches.removeValueForKey("marca")

otrosCoches

for claves in otrosCoches.keys{
    print(claves)
}

for valores in otrosCoches.values{
    print(valores)
}

var myFirstDictionary = ["name" : "Pablo", "surname" : "Garcia", "Age" : 25, "Gender" : "Male"]

myFirstDictionary.removeValueForKey("name")

//print(myFirstDictionary["name"]!)//Estamos obligando a que este valor nunca sea nulo!! IMPORTANTE, no puede ser nada nulo!¡!



/********************** OPTIONAlS *********************/


var nombreA : String? = "Pablo"
var nombreB : String? = nil

// Truco Optionals
// Si sabemos que en algun momento nuestra variable puede o no tener valor colocamos un '?'
// si estamos seguros de que nuestra variable tiene valor y no es nulo colocamos un '!'

// Desempaquetar : comprobar en ese momento que no sea nulo

nombreA = nil

var nombreModA : String!

//nombreModA = "Andres"

// OPTIONAL BIDING

if let bidingModA = nombreModA{ // Esta es la manera que tiene apple (Mas segura) de desempaquetar una variable que tira a nil.
    print("Mi nombre es \(bidingModA)")
}else{
    print("No tengo nombre y es nil")
}

if nombreModA != nil{
    print(nombreModA)
}else{
    print("es nil")
}

var numeroA : Int = 42

var numeroB : Int? //Ojo con esto

var numeroC = Optional("hola mundo")

var numeroD = Optional(35)

// Podemos meter un optional dentro de un optional.

var numeroE : String?? = numeroC

//Esta es la manera sensata de desempaquetar el optional
if let hola = numeroC{
    print("hola")
}else{
    print("ojo con este nulo")
}

//La forma no sensata.
print(numeroC!)

// Creamos un diccionario que sera un mini modelo de datos.
let comidasDia = ["Desayuno" : "Leche con Cereal", "Comida" : "Lentejas con Arroz", "Cena" : "Lasagna"]

// Esta variable es 'optional' pues podría o  no tener valor aun así lo tiene pues es igual a comidasDia->Cena
let cena : String? = nil

// Forma sensata de desempaquetar el "OPTIONAL"
// Siempre if let ---> llamamos optional biding
if let cenaLunes = cena{
    print("Cena del lunes")
}
if cena != nil{
    // me pide desempaquetar la variable cena por eso hay que ponerle '!'
    print("Hoy comemos \(cena!)")
}else{
    var alertController = UIAlertController(title: "Introduce un dato", message: "Ojo!", preferredStyle: UIAlertControllerStyle.Alert)
    
}

/********************* FUNCIONES ****************/

// 1. La funcion sin parámetros de entrada y sin parámetros de retorno.

func nombreFuncion1(){
    print("Mostramos algo")
}


// 2. La función sin parámetros de entrada pero con un parámetro de retorno.

func nombreFuncion2()-> String{
    return "Hola que tal estas."
}

// 3. La función con un parámetro de entrada y un parámetro de retorno.

func nombreFuncion3(nombre :String)-> String{
    return nombre
}


// 4. La funcion con mas de un parámetro de entrada y mas parámetro de retorno.

func nombreFuncion4(nombre: String, edad: Int)->(String, Int){ // Esto ultimo es una tupla.
    return (nombre, edad)
}

nombreFuncion1()

nombreFuncion2()

nombreFuncion3("Me llamo Pablo")

nombreFuncion4("Pablo", edad: 25)
















