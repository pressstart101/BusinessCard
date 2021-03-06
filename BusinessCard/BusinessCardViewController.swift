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
    var imageCaptured = UIImage()
    


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
        let nameTemp = nameLabel.text
        if let unwrappedName = nameTemp{
        if unwrappedName.characters.count < 12{
        nameLabel.font = UIFont.extraLarge()
        }else{
        nameLabel.font = UIFont.extraLargeReduces()
        }
        }
        
        
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

        noteLabel.lineBreakMode = .byWordWrapping // or NSLineBreakMode.ByWordWrapping
        noteLabel.numberOfLines = 0
        
        let tempNote = noteLabel.text
        if let unwrapped = tempNote{
            if (unwrapped.isEmpty){
                    noteImg.isHidden = true
            }
        }
        
    }
    @IBAction func sendButtonAction(_ sender: Any) {
        
        
        captureScreen()
        
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
        
    }
    
    

    func captureScreen() {
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 375, height: 507), false, 0);
        self.view.drawHierarchy(in: CGRect(x: 0, y: -65, width: view.bounds.size.width,height: view.bounds.size.height), afterScreenUpdates: true)
        imageCaptured = UIGraphicsGetImageFromCurrentImageContext()!;
        UIImageWriteToSavedPhotosAlbum(imageCaptured, nil, nil, nil)
        UIGraphicsEndImageContext()
        
    }
    
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        //mailComposerVC.setToRecipients(["someone@somewhere.com"])
        
        

        let name = nameLabel.text
        if name == ""{
            mailComposerVC.setSubject("Business card")
            mailComposerVC.setMessageBody("It was a pleasure to have met you! \n Please find my business card attached to this email.\n \n Best regards \n ", isHTML: false)
        }else if let unwrappedName = name {
            mailComposerVC.setSubject("\(unwrappedName)'s business card")
            mailComposerVC.setMessageBody("It was a pleasure to have met you! \n Please find my business card attached to this email.\n \n Best regards, \n \(unwrappedName)", isHTML: false)

        }else{
            print("Did not autofill email")
        }
//        mailComposerVC.setSubject("\(nameLabel.text)'s business card")
//        mailComposerVC.setMessageBody("It was a pleasure to have met you! \n Please find my business card attached to this email.\n \n Best regards, \n \(nameLabel.text)", isHTML: false)
        let imageData = UIImagePNGRepresentation(imageCaptured) as NSData?
        mailComposerVC.addAttachmentData(imageData as! Data, mimeType: "image/jpeg", fileName: "Business Card")

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
