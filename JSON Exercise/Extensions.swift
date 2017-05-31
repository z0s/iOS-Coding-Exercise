//
//  Extensions.swift
//  JSON Exercise
//
//  Created by Zubair on 5/30/17.
//  Copyright © 2017 Zubair. All rights reserved.
//

import UIKit

extension UIView {
    

    func applyGradient(_ colors: [UIColor]) -> Void {
        self.applyGradient(colors, locations: nil)
    }
    
    func applyGradient(_ colors: [UIColor], locations: [NSNumber]?) -> Void {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = locations
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
extension UIViewController {
    struct Colors {
        //TODO: Create Apple Music Color
        static let customPurple = UIColor(red: 0.5059, green: 0.1529, blue: 0.7961, alpha: 1.0000)
        static let customBlue = UIColor(red: 0.0000, green: 0.7961, blue: 0.9922, alpha: 1.0000)
        static let customRed = UIColor(red: 1.0000, green: 0.2196, blue: 0.4275, alpha: 1.0000)
        static let customGray = UIColor(red:0.96, green:0.96, blue:0.98, alpha:1.0)
        static let customDarkGray = UIColor(red:0.60, green:0.62, blue:0.68, alpha:1.0)
    }
    
    func showSpinner() -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        DispatchQueue.main.async(execute: {
            spinner.hidesWhenStopped = true
            spinner.center = self.view.center
            spinner.color = UIColor.orange
            self.view.addSubview(spinner)
            spinner.startAnimating()
        })
        
        return spinner
    }
    
    
}
extension UIActivityIndicatorView {
    func hide() {
        DispatchQueue.main.async(execute: {
            self.stopAnimating()
            self.removeFromSuperview()
        })
    }
}

