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
        self.view.backgroundColor = .white
        
        let showAlertButton = UIButton()
        self.view.addSubview(showAlertButton)
        showAlertButton.translatesAutoresizingMaskIntoConstraints = false
        showAlertButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        showAlertButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        showAlertButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        showAlertButton.setTitle("Show Default Alert", for: .normal)
        showAlertButton.setTitleColor(.white, for: .normal)
        showAlertButton.backgroundColor = .lightGray
        showAlertButton.addTarget(self, action: #selector(showDefaultAlert(_:)), for: .touchUpInside)
    }
    
    @objc func showDefaultAlert(_ sender: UIButton){
        UIAlerterBuilder().setBackgroundColor(UIColor.lightGray).setImage(name: "notification").show()
    }
}

