//
//  BusinessCardViewController.swift
//  BusinessCard
//
//  Created by walter scott on 12/5/16.
//  Copyright © 2016 mk. All rights reserved.
//

import Foundation
import UIKit

class BusinessCardViewController: UIViewController {
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        backgroundImageSetUp()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    
    
    func backgroundImageSetUp(){
    
        let lineWidth: CGFloat = 5.0;
        let path = UIBezierPath(polygonIn: backgroundImage.bounds, sides: 5, lineWidth: lineWidth, cornerRadius: 30)
        
        let mask = CAShapeLayer()
        mask.path            = path.cgPath
        mask.lineWidth       = lineWidth
        mask.strokeColor     = UIColor.clear.cgColor
        mask.fillColor       = UIColor.white.cgColor
        backgroundImage.layer.mask = mask
        
        let border = CAShapeLayer()
        border.path          = path.cgPath
        border.lineWidth     = lineWidth
        border.strokeColor   = UIColor.black.cgColor
        border.fillColor     = UIColor.clear.cgColor
        backgroundImage.layer.addSublayer(border)
        
        
//        let aPath = UIBezierPath()
//        //aPath.move(to: CGPoint(100.0, 0.0));
//        aPath.addLine(to: <#T##CGPoint#>)
//        
//        UIBezierPath *aPath = [UIBezierPath bezierPath];
//        
//        // Set the starting point of the shape.
//        [aPath moveToPoint:CGPointMake(100.0, 0.0)];
//        
//        // Draw the lines.
//        [aPath addLineToPoint:CGPointMake(200.0, 40.0)];
//        [aPath addLineToPoint:CGPointMake(160, 140)];
//        [aPath addLineToPoint:CGPointMake(40.0, 140)];
//        [aPath addLineToPoint:CGPointMake(0.0, 40.0)];
//        [aPath closePath];
        
        
    }
    
    
}
