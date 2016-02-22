//
//  ICOCEViewController.swift
//  App_Abogados
//
//  Created by CICE on 19/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class ICOCEViewController: UIViewController {
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myPageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for var indice = 1; indice < 10; ++indice{
            
            let imagenes = UIImageView(image: UIImage(named: NSString(format: "CE_%d.jpg", indice) as String))
            imagenes.frame = CGRectMake(CGFloat(indice - 1) * 524, 0, 524, 331)
            myScrollView.addSubview(imagenes)
            
        }
        
        myScrollView.delegate = self
        myScrollView.contentSize = CGSizeMake(9 * 524, 331)
        myScrollView.pagingEnabled = true
        
        myPageControl.numberOfPages = 9
        myPageControl.currentPage = 0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}



extension ICOCEViewController :UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let page = CGFloat(myScrollView.contentOffset.x / myScrollView.frame.size.width)
        myPageControl.currentPage = Int(page)
        
    }
    
}

