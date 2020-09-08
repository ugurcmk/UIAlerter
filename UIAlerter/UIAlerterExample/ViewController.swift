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
        UIAlerterBuilder().setBackgroundColor(UIColor.lightGray).setImage(name: "notification").show()
    }
}

