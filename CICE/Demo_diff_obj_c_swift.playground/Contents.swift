

import UIKit
/******** Objective c *********/
//1
//NSString *myName;
//2
//@property (nonatomic, strong)NString *mySecondName;
//NSMutableDictionary *myDictionary; // Esto es equivalente a la palabra var.

//3 / METODOS / SELECTORES / FUNCIONES
/*
- (IBAction) navegarEnWebClickedButton:(id)sender{
}*/
//4
//UITableView *myTableView = [[UITableView alloc] init];
//UITableView *myTableView = [[UITableView alloc] initWithFrame:CGRectZero, style: UITableViewStyle.Grouped];










/********** Swift ***********/
//1
var name:String

//2
let myFirstName:String

//3
func navegarEnWebClickedButton(sender: AnyObject){
    
}

//4
let myTableView: UITableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Grouped)

//Operadores aritmeticos.

1+1
2+2

"hola" + " " + "Mundo!"


/********* TIPOS BASICOS *********/

var myName = ""

var secondName = String()

if myName.isEmpty{
    print("No hay nada aqui!")
}else{
    print("Aqui hay algo")
}

var nameA: String = "Andres"

nameA = "Felipe"

let profesion = "Desarrollador"

print("Mi nombre es \(nameA) y tengo como profesion \(profesion)")

var numeroA : Int = 4
var numeroB : Double = 3.5

// Vamos a multiplicar los valores numeroA y numeroB y guardarlos en una tercera variable.

var mul : Double = Double(numeroA) * numeroB

typealias EnteroPablo = Int
typealias Nombres = String

let nameC : Nombres = "Pablo"


let numeroC : EnteroPablo = 1

let manzanas : EnteroPablo = 3
let cuantasManzanasTienePablo : String = "\(nameA) tiene \(manzanas) Manzanas"

Int.max
Double.abs(-42.5)



var numeroX: Int = 0

numeroX = 2 * 3 + 5

++numeroX

numeroX -= 10

var sino : Bool = true

if sino{
    "hola"
}else{
    "incorrecto"
}


let nombresClase : [String] = ["Adrian","Pablo","Gonzalo","Jose","Andres","Felipe","Ricardo"]

for var index = 0; index < nombresClase.count; ++index{
    print(nombresClase[index])
}

for var index in 1...5{
    print(index)
}



var myDictionary = [1 : "Uno", 2 : "Dos"]

for valor in myDictionary.values{
    print(valor)
}





/******* ***********/