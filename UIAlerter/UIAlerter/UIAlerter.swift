//
//  UIAlerter.swift
//  UIAlerter
//
//  Created by ugur cakmak on 21.08.2020.
//  Copyright © 2020 ugur cakmak. All rights reserved.
//

import UIKit

open class UIAlerterBuilder: UIView {
    
    private var imageView = UIImageView(image: UIImage(named: "notification"))
    private var titleLabel = UILabel()
    private var textLabel = UILabel()
    private var duration = 0.8
    private let backgroundView = UIView(frame: CGRect(x: 0, y: -210, width: UIScreen.main.bounds.width, height: 210))
    
    public init() {
        // TODO: height could be dynamic
        super.init(frame: .zero)
        self.addSubview(backgroundView)
        
        backgroundView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 15).isActive = true
        imageView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor, constant: 15).isActive = true
        
        titleLabel.isHidden = true
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setBackgroundColor(_ color: UIColor) -> UIAlerterBuilder {
        self.backgroundView.backgroundColor = color
        return self
    }
    
    public func setTitleColor(_ color: UIColor) -> UIAlerterBuilder {
        self.titleLabel.textColor = color
        return self
    }
    
    public func setTextColor(_ color: UIColor) -> UIAlerterBuilder {
        self.textLabel.textColor = color
        return self
    }
    
    public func setImage(name: String) -> UIAlerterBuilder {
        if let image = UIImage(named: name){
            imageView.image = image
        }
        
        return self
    }
    
    public func setTitle(_ title: String) -> UIAlerterBuilder {
        backgroundView.addSubview(titleLabel)
        titleLabel.text = title
        titleLabel.textColor = .black
        titleLabel.isHidden = false
        
        return self
    }
    
    public func setText(_ text: String) -> UIAlerterBuilder {
        backgroundView.addSubview(textLabel)
        textLabel.text = text
        textLabel.textColor = .black
        return self
    }
    
    public func setDuration(seconds: Double) -> UIAlerterBuilder {
        duration = seconds
        return self
    }
    
    public func show(){
        arrangeLayoutConstraints()
        
        self.backgroundView.layer.opacity = 0.5
        
        scaleZoomIn(imageView)
        
        self.window?.windowLevel += 1
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(self)
        }else{
            UIApplication.shared.windows[0].addSubview(self)
        }
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.5,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.8,
            options: .curveEaseInOut,
            animations: {
                self.backgroundView.frame.origin.y = -30
                self.backgroundView.layer.opacity = 1
        },
            completion: { _ in self.slideUp() } )
    }
    
    func arrangeLayoutConstraints() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        if titleLabel.isHidden {
            textLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 40).isActive = true
            textLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20).isActive = true
            textLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: -5).isActive = true
        }else{
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 40).isActive = true
            titleLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20).isActive = true
            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: -5).isActive = true
            
            textLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
            textLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        }
        
    }
    
    
    private func slideUp(){
        UIView.animate(withDuration: 0.5, delay: duration, options: [.curveEaseInOut], animations: {
            self.backgroundView.frame.origin.y = self.backgroundView.frame.origin.y + 30
        }, completion: {_ in
            UIView.animate(withDuration: 0.2, delay: 0.1, options: [.curveEaseInOut], animations: {
                self.backgroundView.frame.origin.y = -210
                self.backgroundView.layer.opacity = 0
            }, completion: nil)
        })
    }
    
    private func scaleZoomIn(_ imageView: UIImageView) {
        UIView.animate(withDuration: 0.6, delay: 0, options: [.curveEaseInOut], animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: {_ in
            self.scaleZoomOut(imageView)
        })
    }
    
    private func scaleZoomOut(_ imageView: UIImageView){
        UIView.animate(withDuration: 0.6, delay: 0, options: [.curveEaseInOut], animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }, completion: {_ in
            self.scaleZoomIn(imageView)
        })
    }
}
