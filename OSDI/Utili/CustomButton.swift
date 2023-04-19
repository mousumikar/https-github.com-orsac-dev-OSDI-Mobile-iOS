//
//  CustomButton.swift
//  OSDI
//
//  Created by Mousumi Kar on 10/04/23.
//

import Foundation
import UIKit
@IBDesignable
class CustomButton: UIButton {
    @IBInspectable var borderColor: UIColor? = UIColor.clear {
        didSet {
            layer.borderColor = self.borderColor?.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = self.borderWidth
        }
    }
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet {
            layer.shadowOpacity = self.shadowOpacity
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = self.cornerRadius
            layer.masksToBounds = self.cornerRadius > 0
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderWidth = self.borderWidth
        self.layer.borderColor = self.borderColor?.cgColor
        self.layer.shadowOpacity=self.shadowOpacity
    }
    
    let gradientLayer = CAGradientLayer()
       
       @IBInspectable
       var topGradientColor: UIColor? {
           didSet {
               setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
           }
       }
       
       @IBInspectable
       var bottomGradientColor: UIColor? {
           didSet {
               setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
           }
       }
       
       private func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
           if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
               gradientLayer.frame = bounds
               gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
               gradientLayer.borderColor = layer.borderColor
               gradientLayer.borderWidth = layer.borderWidth
               gradientLayer.cornerRadius = layer.cornerRadius
               layer.insertSublayer(gradientLayer, at: 0)
           } else {
               gradientLayer.removeFromSuperlayer()
           }
       }
}
