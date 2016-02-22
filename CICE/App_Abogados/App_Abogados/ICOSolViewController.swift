//
//  ICOSolViewController.swift
//  App_Abogados
//
//  Created by CICE on 19/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit
import MessageUI

class ICOSolViewController: UIViewController {
    
    
    //MARK: - IBACTION
    
    @IBAction func sendMailNegociosInmobiliarios(sender: AnyObject) {
        
        let mailComposeViewController = configureMailComposeViewController(["info@icologic.com", "info@andresocampo.com"],
            mailComposeVCSubject: "",
            nameTypeData: "inversion",
            ofTypeData: "pdf",
            mimeTypeData: "text/pdf",
            fileNameData: "inversion.pdf",
            mailMessageVCBody: "Por favor envia el Flyer",
            isHTML: false)
        
        if MFMailComposeViewController.canSendMail(){
            
            presentViewController(mailComposeViewController, animated: true, completion: nil)
            
        }else{
            
            showSendMailError()
        }
        
        
    }
    
    
    @IBAction func sendMailBackoffice(sender: AnyObject) {
        
        
        
        let mailComposeViewController = configureMailComposeViewController(["info@icologic.com", "info@andresocampo.com"],
            mailComposeVCSubject: "",
            nameTypeData: "backoffice",
            ofTypeData: "pdf",
            mimeTypeData: "text/pdf",
            fileNameData: "backoffice.pdf",
            mailMessageVCBody: "Por favor envia el Flyer",
            isHTML: false)
        
        if MFMailComposeViewController.canSendMail(){
            
            presentViewController(mailComposeViewController, animated: true, completion: nil)
            
        }else{
            
            showSendMailError()
        }
        
    }
    
    
    @IBAction func sendMailProyectos(sender: AnyObject) {
        
        let mailComposeViewController = configureMailComposeViewController(["info@icologic.com", "info@andresocampo.com"],
            mailComposeVCSubject: "",
            nameTypeData: "proyecto",
            ofTypeData: "pdf",
            mimeTypeData: "text/pdf",
            fileNameData: "proyecto.pdf",
            mailMessageVCBody: "Por favor envia el Flyer",
            isHTML: false)
        
        if MFMailComposeViewController.canSendMail(){
            
            presentViewController(mailComposeViewController, animated: true, completion: nil)
            
        }else{
            
            showSendMailError()
        }
        
        
    }
    
    
    //MARK: - UTILS
    func configureMailComposeViewController(mailComposeVCTorecipients:[String], mailComposeVCSubject:String, nameTypeData:String, ofTypeData: String, mimeTypeData: String, fileNameData: String, mailMessageVCBody: String, isHTML: Bool) -> MFMailComposeViewController{
        
        
        let mailComposeVC = MFMailComposeViewController()
        
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients(mailComposeVCTorecipients)
        mailComposeVC.setSubject(mailComposeVCSubject)
        
        let path = NSBundle.mainBundle().pathForResource(nameTypeData, ofType: ofTypeData)
        var myData : NSData?
        
        do{
            myData = try NSData(contentsOfFile: path!, options: .UncachedRead)
            
        }catch let error as NSError{
            
            print(error)
        }
        
        mailComposeVC.addAttachmentData(myData!,mimeType: mimeTypeData, fileName: fileNameData)
        mailComposeVC.setMessageBody(mailMessageVCBody, isHTML: isHTML)
        
        return mailComposeVC
        
    }
    
    func showSendMailError(){
        
        let sendmailErrorAlert = UIAlertController(title: "ATENCIÓN", message: "No se ha logrado enviar el mail", preferredStyle: .Alert)
        let actionView = UIAlertAction(title: "OK", style: .Default, handler: nil)
        sendmailErrorAlert.addAction(actionView)
        
        presentViewController(sendmailErrorAlert, animated: true, completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}




extension  ICOSolViewController : MFMailComposeViewControllerDelegate{
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
}
