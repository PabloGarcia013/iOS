//
//  SecondView.swift
//  Shooting It
//
//  Created by CICE on 14/12/15.
//  Copyright © 2015 A.I.Dev. All rights reserved.
//

import UIKit
import MessageUI

class SecondView: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let htmlFile = NSBundle.mainBundle().pathForResource("tiroAlBlanco", ofType: "html"){
            let htmlData = NSData(contentsOfFile: htmlFile)
            let baseUrl = NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
            webView.loadData(htmlData!, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseUrl)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBOULET
    
    @IBOutlet weak var webView: UIWebView!
    
    // MARK: - IBACTION
    
    @IBAction func closeInfoView(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func sendMail(sender: AnyObject) {
        
        let mailComposeViewController = configuredMailViewController()
        if MFMailComposeViewController.canSendMail(){
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        }else{
            showSendMailError()
        }
        
    }
    
    // MARK: - MFMailComposeViewControllerDelegate
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: - UTILS
    
    func configuredMailViewController()->MFMailComposeViewController{
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["info@shootingit.com"])
        mailComposerVC.setSubject("")
        mailComposerVC.setMessageBody("Enviar un mail a traves de shooting It!", isHTML: false)
        return mailComposerVC
    }
    
    func showSendMailError(){
        let sendMailErrorAlert = UIAlertController(title: "Error!", message: "No se ha logrado enviar el mail, intentalo otra vez!", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let alertAction = UIAlertAction(title: "Cerrar", style: UIAlertActionStyle.Default, handler: nil)
        sendMailErrorAlert.addAction(alertAction)
        presentViewController(sendMailErrorAlert, animated: true, completion: nil)
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
