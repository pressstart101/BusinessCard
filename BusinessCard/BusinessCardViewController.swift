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
import MessageUI

class BusinessCardViewController: UIViewController, MFMailComposeViewControllerDelegate {
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBusinessCardView()
        // Do any additional setup after loading the view, typically from a nib.
   
        
        
        func draw(_ rect: CGRect) {
            let aPath = UIBezierPath()
            
            aPath.move(to: CGPoint(x:20, y:50))
            
            aPath.addLine(to: CGPoint(x:300, y:50))
            
            //Keep using the method addLineToPoint until you get to the one where about to close the path
            
            aPath.close()
            
            //If you want to stroke it with a red color
            UIColor.red.set()
            aPath.stroke()
            //If you want to fill it as well
            aPath.fill()
        }
        
        
    }
    
    func setUpBusinessCardView(){
        profilePicLabel.clipsToBounds = true;
        profilePicLabel.layer.cornerRadius = 20;
        profilePicLabel.layer.cornerRadius = profilePicLabel.frame.size.height/2;
        profilePicLabel.image = thePic
        
        
        emailLabel.text = emailText
        phoneLabel.text = phoneText
        websiteLabel.text = websiteText
        noteLabel.text = noteText
        nameLabel.text = nameText.localizedCapitalized
        
        emailLabel.font = UIFont.small()
        phoneLabel.font = UIFont.small()
        websiteLabel.font = UIFont.small()
        noteLabel.font = UIFont.thin()
        nameLabel.font = UIFont.extraLarge()
        
        
        sendLabel.setBorderColor(Colors.borderColorPressed, for: .highlighted)
        //doneButtonLabel.setCornerRadius(25.0)
        sendLabel.setBackgroundColor(Colors.backgroundColorPressed, for: .highlighted)
        sendLabel.setBackgroundColor(Colors.backgroundColor)
        sendLabel.setBorderColor(Colors.borderColor)
        sendLabel.setBorderWidth(2.5, for: .normal, animated: true, animationDuration: 0.5)
        sendLabel.setBorderWidth(3.5, for: .highlighted, animated: false)
        sendLabel.setCornerRadius(sendLabel.frame.size.height/2)
        
        sendLabel.setShadowColor(UIColor.gray)
        sendLabel.setShadowRadius(5.0)
        sendLabel.setShadowOpacity(5.0)
        
        
        sendLabel.titleLabel?.font = UIFont.large()
        view.addSubview(sendLabel)
        
        
        
        emailImg.setFAIconWithName(icon: FAType.FAEnvelopeO, textColor: Colors.iconsColor, backgroundColor: UIColor.clear)
        phoneImg.setFAIconWithName(icon: FAType.FAPhone, textColor: Colors.iconsColor, backgroundColor: UIColor.clear)
        websiteImg.setFAIconWithName(icon: FAType.FAGlobe, textColor: Colors.iconsColor, backgroundColor: UIColor.clear)
        noteImg.setFAIconWithName(icon: FAType.FACommentO, textColor: Colors.iconsColor, backgroundColor: UIColor.clear)
        
        
        
        emailLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.gray, thickness: 0.5)
        phoneLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.gray, thickness: 0.5)
        websiteLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.gray, thickness: 0.5)

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
    @IBAction func sendButtonAction(_ sender: Any) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
        
    }
    
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        //mailComposerVC.setToRecipients(["someone@somewhere.com"])
        
        
        ////////!!!!!REMOVE OPTIONAL
        mailComposerVC.setSubject("\(nameLabel.text)'s business card")
        mailComposerVC.setMessageBody("It was a pleasure to have met you! \n Please find my business card attached to this email.\n \n Best regards, \n \(nameLabel.text)", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    
    

    
    
}
