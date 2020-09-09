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
        super.init(frame: CGRect(x: 0, y: -210, width: UIScreen.main.bounds.width, height: 210))
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
    
    public func setImage(name: String) -> UIAlerterBuilder {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 105, width: 40, height: 40))
        if let image = UIImage(named: name){
            imageView.image = image
        }
        self.addSubview(imageView)
        
        return self
    }
    
    public func setTitle(_ title: String) -> UIAlerterBuilder {
        let titleLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 20))
//        titleLabel.backgroundColor = .orange
        titleLabel.text = title
        titleLabel.textColor = .black
        self.addSubview(titleLabel)
        
        return self
    }
    
    public func setText(_ text: String) -> UIAlerterBuilder {
        let textLabel = UILabel(frame: CGRect(x: 100, y: 130, width: 200, height: 20))
//        textLabel.backgroundColor = .green
        textLabel.text = text
        textLabel.textColor = .black
        self.addSubview(textLabel)
        
        return self
    }
    
    public func show(){
        self.layer.opacity = 0.5
        
        self.window?.windowLevel += 1
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(self)
        }else{
            UIApplication.shared.windows[0].addSubview(self)
        }
        
        UIView.animate(withDuration: 0.3, delay:0.2, options: [.curveEaseInOut], animations: {
            self.frame.origin.y = 0
            self.layer.opacity = 1
        }, completion: { _ in
            UIView.animate(withDuration: 0.20, delay: 0, options: [.curveEaseInOut], animations: {
                self.frame.origin.y = self.frame.origin.y - 30
            }, completion: {_ in
                UIView.animate(withDuration: 0.2, delay: 1, options: [.curveEaseInOut], animations: {
                    self.frame.origin.y = self.frame.origin.y + 30
                }, completion: {_ in
                    UIView.animate(withDuration: 0.2, delay: 0.1, options: [.curveEaseInOut], animations: {
                        self.frame.origin.y = -210
                        self.layer.opacity = 0
                    }, completion: nil)
                })
            })
        })
        
    }
}
