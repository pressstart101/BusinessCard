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
    
    @IBOutlet weak var sendLabel: SimpleButton!
    @IBOutlet weak var emailImg: UIImageView!
    @IBOutlet weak var phoneImg: UIImageView!
    @IBOutlet weak var websiteImg: UIImageView!
    @IBOutlet weak var noteImg: UIImageView!

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var emailText = String()
    var phoneText = String()
    var websiteText = String()
    var noteText = String()
    var nameText = String()
    let backgroundColor = UIColor(red: 180/255, green: 204/255, blue: 255/255, alpha: 1)
    let borderColor = UIColor(red: 160/255, green: 177/255, blue: 217/255, alpha: 1)
    let backgroundColorPressed = UIColor(red: 102/255, green: 150/255, blue: 255/255, alpha: 1)
    let borderColorPressed = UIColor(red: 80/255, green: 120/255, blue: 255/255, alpha: 1)
    
    
    let iconsColor = UIColor(red: 80/255, green: 102/255, blue: 255/255, alpha: 1)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        profilePicLabel.clipsToBounds = true;
        profilePicLabel.layer.cornerRadius = 20;
        profilePicLabel.layer.cornerRadius = profilePicLabel.frame.size.height/2;
        profilePicLabel.image = thePic
        
        
        emailLabel.text = emailText
        phoneLabel.text = phoneText
        websiteLabel.text = websiteText
        noteLabel.text = noteText
        nameLabel.text = nameText
        
        
        sendLabel.setBorderColor(borderColorPressed, for: .highlighted)
        //doneButtonLabel.setCornerRadius(25.0)
        sendLabel.setBackgroundColor(backgroundColorPressed, for: .highlighted)
        sendLabel.setBackgroundColor(backgroundColor)
        sendLabel.setBorderColor(borderColor)
        sendLabel.setBorderWidth(2.5, for: .normal, animated: true, animationDuration: 0.5)
        sendLabel.setBorderWidth(3.5, for: .highlighted, animated: false)
        sendLabel.setCornerRadius(sendLabel.frame.size.height/2)
        
        sendLabel.setShadowColor(UIColor.gray)
        sendLabel.setShadowRadius(5.0)
        sendLabel.setShadowOpacity(5.0)
        
        view.addSubview(sendLabel)
        
        
        
        emailImg.setFAIconWithName(icon: FAType.FAEnvelopeO, textColor: iconsColor, backgroundColor: UIColor.clear)
        phoneImg.setFAIconWithName(icon: FAType.FAPhone, textColor: iconsColor, backgroundColor: UIColor.clear)
        websiteImg.setFAIconWithName(icon: FAType.FAGlobe, textColor: iconsColor, backgroundColor: UIColor.clear)
        noteImg.setFAIconWithName(icon: FAType.FACommentO, textColor: iconsColor, backgroundColor: UIColor.clear)
        
        /*
         FAType.FAPhone
         FAType.FATwitter
         FAType.FAChrome
         FAType.FADesktop
         FAType.FAGlobe
         FAType.FACommentO
         FAType.FAEnvelopeO
         
         */
        
//        imageTest.setFAIconWithName(icon: FAType.FAPhone, textColor: UIColor.blue, backgroundColor: UIColor.clear)
//        
//        testLabel.FAIcon = FAType.FAGithub
//        
//        testLabel.setFAIcon(icon: FAType.FAGithub, iconSize: 15)
//        //testLabel.setFAText(prefixText: "follow me on ", icon: FAType.FATwitter, postfixText: ". Thanks!", size: 25)
//        
//        testLabel.setFAText(prefixText: "follow me on ", icon: FAType.FAGlobe, postfixText: ". Thanks!", size: 50)
//
//        
//        // bigger icon:
////        testLabel.setFAText(prefixText: "follow me on  ", icon: FAType.FATwitter, postfixText: ". Thanks!", size: 5, iconSize: 6)
//        testLabel.setFAColor(color: UIColor(red: 102/255, green: 102/255, blue: 255/255, alpha: 1))
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    
    

    
    
}
