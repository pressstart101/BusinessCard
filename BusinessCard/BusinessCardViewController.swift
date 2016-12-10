//
//  BusinessCardViewController.swift
//  BusinessCard
//
//  Created by walter scott on 12/5/16.
//  Copyright © 2016 mk. All rights reserved.
//

import Foundation
import UIKit
import Font_Awesome_Swift

class BusinessCardViewController: UIViewController {
    @IBOutlet weak var profilePicLabel: UIImageView!
    var thePic = UIImage()
    
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        profilePicLabel.clipsToBounds = true;
        profilePicLabel.layer.cornerRadius = 20;
        profilePicLabel.layer.cornerRadius = profilePicLabel.frame.size.height/2;
        profilePicLabel.image = thePic
        
        
        /*
         FAType.FAPhone
         FAType.FATwitter
         FAType.FAChrome
         FAType.FADesktop
         FAType.FAGlobe
         FAType.FACommentO
         FAType.FAEnvelopeO
         
         */
        
        testLabel.FAIcon = FAType.FAGithub
        
        testLabel.setFAIcon(icon: FAType.FAGithub, iconSize: 15)
        //testLabel.setFAText(prefixText: "follow me on ", icon: FAType.FATwitter, postfixText: ". Thanks!", size: 25)
        
        testLabel.setFAText(prefixText: "follow me on ", icon: FAType.FAGlobe, postfixText: ". Thanks!", size: 50)

        
        // bigger icon:
//        testLabel.setFAText(prefixText: "follow me on  ", icon: FAType.FATwitter, postfixText: ". Thanks!", size: 5, iconSize: 6)
        testLabel.setFAColor(color: UIColor(red: 102/255, green: 102/255, blue: 255/255, alpha: 1))
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    
    

    
    
}
