//
//  ViewController.swift
//  App7_UIPickerView
//
//  Created by CICE on 9/12/15.
//  Copyright © 2015 A.I.Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource , UIPickerViewDelegate{

    //MARK: - LOCAL VAR
    
    //MARK: - DATA MODEL
    
    let pickerData = ["Mozzarela","Gorgonzola","Provolone", "Brie", "Cheddar", "MonterreyJack","Slinton","Boursin"]
    let foodTextDescription = [
        "Mozzarela" : "La mozzarella (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca.",
        "Gorgonzola": "El gorgonzola es un queso italiano de mesa, de pasta cremosa y untuosa, hecho con leche entera pasteurizada de vaca que se presenta en dos variedades: dulce y picante. Era conocido este queso ya desde la Edad Media, aunque solo en el siglo XI comenzó a tener el aspecto enmohecido que posee en la actualidad. Se emplea frecuentemente como ingrediente en diversos platos de la cocina italiana.",
        "Provolone" : "El provolone (Provolone Val Padana) es un queso italiano originarios del sur del país, donde se sigue produciendo en piezas de 10 a 15 cm con diversas formas (pera alargada, salchicha o cono). Sin embargo, la región de producción más importante de provolone es actualmente el norte de Italia (Piamonte, Lombardía y Véneto). La familia Provenzano de Venecia afirma haber sido la descubridora de este tipo de queso, pero no ha podido demostrarlo. El queso Provolone fue descubierto o creado por la Familia Visani en Deruta (centro de Italia) En Estados Unidos se comercializa con el nombre Provolone un queso relativamente barato comercializado como aliño para pizzas, que se parece al original italiano sólo en color y textura, no en sabor. El término «Provolone» (‘Provola grande’) apareció a finales del siglo XIX cuando empezó a ser producido en las regiones del norte de Italia y el queso adoptó su actual tamaño grande. La denominación de origen protegida a nivel europeo es Provolone Valpadana, no habiendo solicitado Italia la protección del nombre «Provolone».",
        "Brie" : "Descripcion de Brie",
        "Cheddar" : "Descripcion de Cheddar",
        "MonterreyJack" : "Descripcion de Monterrey Jack",
        "Slinton" : "Descripcion de Slinton",
        "Boursin" : "Descripcion de Boursin"
        ]
    
    
    //MARK: - IBOULET
    
    @IBOutlet weak var foodTitle: UILabel!
    @IBOutlet weak var foodDescription: UITextView!
    @IBOutlet weak var foodPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodTitle.text = pickerData[0]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    // Numero de componentes.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
       return 1
    }
    
    //Numero de filas del componente.
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
            return pickerData.count
    }
    
    
    //MARK: Delegate
    // Pinta cada uno de los objetos del array.
    func pickerView(pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int) -> String? {
            return pickerData[row]
            
        
    }

    // Estamos estilando la letra
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 26.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
        pickerLabel.attributedText = myTitle
        let hue = CGFloat(row)/CGFloat(pickerData.count)
        pickerLabel.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness:1.0, alpha: 1.0)
        pickerLabel.textAlignment = .Center
        return pickerLabel
    }
    
    // Damos separación a los datos del picker
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    // Se dispara cuando se selecciona un elemento.
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        foodTitle.text = pickerData[row]
        foodDescription.text = foodTextDescription[pickerData[row]]
        
    }
    
    //  Hay que indicar que el outlet foodPicker que es delegado y datasource, para ello podemos hacerlo en el storyboard y arrastrando con el control pulsado y soltamos en el View Controler o poniendo en codigo foodPicker.delegate = self


}
/* Para delegar se podria hacer tambien de esta manera, en vez de ponerlo en la cabecera de la declaración de la clase.
extension ViewController: UIPickerViewDelegate{
    
}
*/
