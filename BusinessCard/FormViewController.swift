//
//  ViewController.swift
//  BusinessCard
//
//  Created by walter scott on 12/4/16.
//  Copyright © 2016 mk. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    @IBOutlet weak var cameraButtonLabel: SimpleButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        //****button setup
        //http://aloco.github.io/SimpleButton/swift_output/
        //https://github.com/aloco/SimpleButton
        //****
        
        
        cameraButtonLabel.setBorderWidth(2.0, for: .normal)
        cameraButtonLabel.setBorderColor(UIColor.darkGray, for: .highlighted)
        cameraButtonLabel.setCornerRadius(10.0)
        //cameraButtonLabel.setTitleImageSpacing(20.0)
        cameraButtonLabel.setShadowColor(UIColor.gray, for: .application)
        view.addSubview(cameraButtonLabel)
        cameraButtonLabel.setBackgroundColor(UIColor.blue, for: .highlighted)
        cameraButtonLabel.setBackgroundColor(UIColor.cyan)
        cameraButtonLabel.setBorderColor(UIColor.gray)
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    @IBAction func cameraButtonAction(_ sender: UIButton) {
    }
    

}

