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
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
extension UIViewController {
    struct Colors {
        //TODO: Create Apple Music Color
    }
}
