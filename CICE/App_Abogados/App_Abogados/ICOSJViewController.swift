//
//  ICOSJViewController.swift
//  App_Abogados
//
//  Created by CICE on 19/2/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class ICOSJViewController: UIViewController {
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myPageControll: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        for var indice = 1; indice < 15; ++indice{
            
            let imagenes = UIImageView(image: UIImage(named: NSString(format: "AJ_%d.jpg", indice) as String))
            imagenes.frame = CGRectMake(CGFloat(indice - 1) * 524, 0, 524, 331)
            myScrollView.addSubview(imagenes)
            
        }
        
        myScrollView.delegate = self
        myScrollView.contentSize = CGSizeMake(14 * 524, 331)
        myScrollView.pagingEnabled = true
        
        myPageControll.numberOfPages = 14
        myPageControll.currentPage = 0
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ICOSJViewController :UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let page = CGFloat(myScrollView.contentOffset.x / myScrollView.frame.size.width)
        myPageControll.currentPage = Int(page)
        
    }
    
}


