//
//  ViewController.swift
//  UIAlerterExample
//
//  Created by ugur cakmak on 20.08.2020.
//  Copyright © 2020 ugur cakmak. All rights reserved.
//

import UIKit
import UIAlerter

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        //UIAlerterBuilder().setBackgroundColor(UIColor.gray).show()
        
        let alert = UIAlerterBuilder().setBackgroundColor(UIColor.gray)
        alert.layer.opacity = 1
        
        UIApplication.shared.keyWindow?.addSubview(alert)
        
//        UIView.animate(withDuration: 0.2, animations: {
//            alert.layer.opacity = 1
//            alert.layer.transform = CATransform3DMakeScale(1, 1, 1)
//        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, animations: {
            alert.frame.origin.y = 0
            //alert.layer.opacity = 1
        }, completion: nil)
    }
}

