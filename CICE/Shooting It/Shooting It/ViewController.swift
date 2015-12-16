//
//  ViewController.swift
//  Shooting It
//
//  Created by CICE on 14/12/15.
//  Copyright © 2015 A.I.Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: - LOCAL VAR
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    //MARK: - IBOULET
    
    @IBOutlet weak var pointsSlider: UISlider!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    //MARK: -IBACTION
    
    @IBAction func pulsameButtonAction(sender: AnyObject) {
        
        let message = "Puntuacion esta ronda: \(calculatePoints())"
        
        let alertView = UIAlertController(title: generateTittle(), message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let alertAction = UIAlertAction(title: "Siguiente Ronda", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            self.updateInfo()
        }
        alertView.addAction(alertAction)
        presentViewController(alertView, animated: true, completion: nil)
        
    }
    
    @IBAction func moveSliderPoints(sender: AnyObject) {
        
        currentValue = lroundf(pointsSlider.value)
        
    }
    
    
    @IBAction func resetButtonAction(sender: AnyObject) {
        
        startNewGame()
        
    }

    
    //MARK: - APP LIFE CYCLE
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        self.startNewGame()
        
        let thumbImageNormal = UIImage(named:"slider")
        pointsSlider.setThumbImage(thumbImageNormal, forState: UIControlState.Normal)
        
        let thumbImageHighLight = UIImage(named:"sliderHighlight")
        pointsSlider.setThumbImage(thumbImageHighLight, forState: UIControlState.Highlighted)
        
        let inset = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        if let trackLeftImage = UIImage(named: "trackSliderLeft"){
            let trackLeftResizable = trackLeftImage.resizableImageWithCapInsets(inset)
            pointsSlider.setMinimumTrackImage(trackLeftResizable, forState: UIControlState.Normal)
        }
        if let trackRightImage = UIImage(named: "trackSliderRight"){
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(inset)
            pointsSlider.setMaximumTrackImage(trackRightResizable, forState: UIControlState.Normal)
            
        }

        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()

    }
    
    
    //MARK: - UTILS FUNCTIONS
    
    func updateInfo(){
        
        self.generateRamdonValue()
        self.currentValue = 50
        self.pointsSlider.value = Float(self.currentValue)
        ++self.round
        self.roundLabel.text = String(self.round)
        self.pointsLabel.text = String(self.score)
        
    }
    
    func generateTittle()->String{
        
        let difference = abs(currentValue - targetValue)
        var message : String = ""
        switch difference{
            case 0:
                message = "Perfecto! Diste en el blanco!"
            case 1:
                message = "UFF! Casi!"
            case 2...20:
                message = "Te faltó poco!"
            case 41...60:
                message = "Necesitas practicar un poco más!"
            case 61...100:
                message = "Que desastre.."
        default:
            break
        }
        return message
        
    }
    
    func calculatePoints()-> Int{
        
        let points = 100 - abs(currentValue - targetValue)
        self.score = self.score + points
        return points
        
    }
    
    func generateRamdonValue(){
        
        targetValue = Int(arc4random_uniform(100)+1)
        valueLabel.text = String(targetValue)
        
    }
    
    func startNewGame(){
        
        self.generateRamdonValue()
        self.roundLabel.text = "0"
        self.pointsLabel.text = "0"
        self.roundLabel.text = "1"
        
        self.score = 0
        self.round = 1
        self.currentValue = 50
        
        self.pointsSlider.value = Float(self.currentValue)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
