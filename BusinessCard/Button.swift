//
//  Button.swift
//  BusinessCard
//
//  Created by walter scott on 12/5/16.
//  Copyright © 2016 mk. All rights reserved.
//

import Foundation
import UIKit
class PrimaryButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setBorderWidth(4.0, for: .normal)
        setBackgroundColor(UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1.0), for: .normal)
        setBackgroundColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), for: .highlighted)
        setBorderColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), for: .normal)
        setScale(0.98, for: .highlighted)
        setTitleColor(UIColor.white, for: .normal)
    }
}


struct Colors{
    static let backgroundColor = UIColor(red: 151/255, green: 203/255, blue: 233/255, alpha: 1)
    static let borderColor = UIColor(red: 108/255, green: 179/255, blue: 224/255, alpha: 1)
    static let backgroundColorPressed = UIColor(red: 87/255, green: 168/255, blue: 219/255, alpha: 1)
    static let borderColorPressed = UIColor(red: 45/255, green: 147/255, blue: 210/255, alpha: 1)
    
    static let iconsColor = UIColor(red: 45/255, green: 147/255, blue: 210/255, alpha: 1)
    
    //Pale
    static let backgroundColorPale = UIColor(red: 192/255, green: 223/255, blue: 242/255, alpha: 1)
    static let borderColorPale = UIColor(red: 149/255, green: 201/255, blue: 233/255, alpha: 1)
    static let backgroundColorPressedPale = UIColor(red: 128/255, green: 190/255, blue: 229/255, alpha: 1)
    static let borderColorPressedPale = UIColor(red: 86/255, green: 169/255, blue: 220/255, alpha: 1)
    
}



extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}



extension UIFont {
    
    class func large() -> UIFont {
        return UIFont(name: "PingFangSC-Regular", size: 20)!
    }
    
    class func medium() -> UIFont {
        return UIFont(name: "PingFangSC-Regular", size: 20)!
    }
    
    class func small() -> UIFont {
        return UIFont(name: "PingFangSC-Regular", size: 18)!
    }
    
    class func thin() -> UIFont {
        return UIFont(name: "PingFangSC-Thin", size: 18)!
    }
    
    class func extraLarge() -> UIFont {
        return UIFont(name: "PingFangSC-Semibold", size: 45)!
    }
    
    class func extraLargeReduces() -> UIFont {
        return UIFont(name: "PingFangSC-Semibold", size: 30)!
    }
}


extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect.init(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect.init(x: 0, y: 0, width: thickness, height: frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect.init(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
}



extension UIBezierPath {
    
    /// Create UIBezierPath for regular polygon with rounded corners
    ///
    /// - parameter rect:            The CGRect of the square in which the path should be created.
    /// - parameter sides:           How many sides to the polygon (e.g. 6=hexagon; 8=octagon, etc.).
    /// - parameter lineWidth:       The width of the stroke around the polygon. The polygon will be inset such that the stroke stays within the above square. Default value 1.
    /// - parameter cornerRadius:    The radius to be applied when rounding the corners. Default value 0.
    
    convenience init(polygonIn rect: CGRect, sides: Int, lineWidth: CGFloat = 1, cornerRadius: CGFloat = 0) {
        self.init()
        
        let theta = 2 * CGFloat.pi / CGFloat(sides)                        // how much to turn at every corner
        let offset = cornerRadius * tan(theta / 2)                  // offset from which to start rounding corners
        let squareWidth = min(rect.size.width, rect.size.height)    // width of the square
        
        // calculate the length of the sides of the polygon
        
        var length = squareWidth - lineWidth
        if sides % 4 != 0 {                                         // if not dealing with polygon which will be square with all sides ...
            length = length * cos(theta / 2) + offset / 2           // ... offset it inside a circle inside the square
        }
        let sideLength = length * tan(theta / 2)
        
        // start drawing at `point` in lower right corner, but center it
        
        var point = CGPoint(x: rect.origin.x + rect.size.width / 2 + sideLength / 2 - offset, y: rect.origin.y + rect.size.height / 2 + length / 2)
        var angle = CGFloat.pi
        move(to: point)
        
        // draw the sides and rounded corners of the polygon
        
        for _ in 0 ..< sides {
            point = CGPoint(x: point.x + (sideLength - offset * 2) * cos(angle), y: point.y + (sideLength - offset * 2) * sin(angle))
            addLine(to: point)
            
            let center = CGPoint(x: point.x + cornerRadius * cos(angle + .pi / 2), y: point.y + cornerRadius * sin(angle + .pi / 2))
            addArc(withCenter: center, radius: cornerRadius, startAngle: angle - .pi / 2, endAngle: angle + theta - .pi / 2, clockwise: true)
            
            point = currentPoint
            angle += theta
        }
        
        close()
        
        self.lineWidth = lineWidth           // in case we're going to use CoreGraphics to stroke path, rather than CAShapeLayer
        lineJoinStyle = .round
    }
    
}
