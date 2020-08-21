//
//  UIAlerter.swift
//  UIAlerter
//
//  Created by ugur cakmak on 21.08.2020.
//  Copyright © 2020 ugur cakmak. All rights reserved.
//

import UIKit

open class UIAlerterBuilder: UIView {
    
    
    public init() {
        // TODO: height could be dynamic
        super.init(frame: CGRect(x: 0, y: -200, width: UIScreen.main.bounds.width, height: 200))
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setBackgroundColor(_ color: UIColor) -> UIAlerterBuilder {
        self.backgroundColor = color
        return self
    }

    func textColor(){
        
    }
    
    func setIcon(){
        
    }
    
    public func show(){
        self.window?.windowLevel += 1
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(self)
            window.layoutIfNeeded()
        }else{
            UIApplication.shared.windows[0].addSubview(self)
            UIApplication.shared.windows[0].layoutIfNeeded()
        }
        
    }
}
