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
    @IBOutlet weak var profilePicLabel: UIImageView!
    var thePic = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        profilePicLabel.clipsToBounds = true;
        profilePicLabel.layer.cornerRadius = 20;
        profilePicLabel.layer.cornerRadius = profilePicLabel.frame.size.height/2;
        profilePicLabel.image = thePic
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    
    

    
    
}
