//
//  ViewController.swift
//  BusinessCard
//
//  Created by walter scott on 12/4/16.
//  Copyright © 2016 mk. All rights reserved.
//

import UIKit
import Font_Awesome_Swift
class FormViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var cameraButtonLabel: SimpleButton!
    @IBOutlet weak var libraryButtonLabel: SimpleButton!
    @IBOutlet weak var doneButtonLabel: SimpleButton!
    @IBOutlet weak var picToSave: UIImageView!
    @IBOutlet weak var nameToSaveLabel: UITextField!
    @IBOutlet weak var emailToSaveLabel: UITextField!
    @IBOutlet weak var phoneToSaveLabel: UITextField!
    @IBOutlet weak var websiteToSaveLabel: UITextField!
    @IBOutlet weak var noteToSaveLabel: UITextView!
    @IBOutlet weak var uploadPictureLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        doneButtonLabel.layer.cornerRadius = doneButtonLabel.frame.size.height/2;
//
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFormView()
        phoneToSaveLabel.addTarget(self, action: #selector(textField(_:shouldChangeCharactersIn:replacementString:)), for: .editingChanged)

    }

    func setUpFormView(){
        self.hideKeyboardWhenTappedAround()
        
        noteToSaveLabel.layer.cornerRadius = 10;
        picToSave.clipsToBounds = true;
        picToSave.layer.cornerRadius = 20;
        picToSave.layer.cornerRadius = picToSave.frame.size.height/2;
        picToSave.layer.borderColor = UIColor.gray.cgColor
        picToSave.layer.borderWidth = 1.0
        //****button setup
        //http://aloco.github.io/SimpleButton/swift_output/
        //https://github.com/aloco/SimpleButton
        //****
        
        cameraButtonLabel.setBorderWidth(1.0, for: .normal)
        cameraButtonLabel.setBorderColor(Colors.borderColorPressed, for: .highlighted)
        cameraButtonLabel.setCornerRadius(8.0)
        cameraButtonLabel.setBackgroundColor(Colors.backgroundColorPressed, for: .highlighted)
        cameraButtonLabel.setBackgroundColor(Colors.backgroundColor, for: .normal)
        cameraButtonLabel.setBorderColor(Colors.borderColor)
        cameraButtonLabel.setBorderWidth(1.5, for: .normal, animated: true, animationDuration: 0.2)
        cameraButtonLabel.setBorderWidth(2.0, for: .highlighted, animated: false)
        
        cameraButtonLabel.setShadowColor(UIColor.gray)
        cameraButtonLabel.setShadowRadius(5.0)
        cameraButtonLabel.setShadowOpacity(5.0)
        cameraButtonLabel.titleLabel?.font = UIFont.medium()
        view.addSubview(cameraButtonLabel)
        
        
        
        
        libraryButtonLabel.setBorderWidth(1.0, for: .normal)
        libraryButtonLabel.setBorderColor(Colors.borderColorPressed, for: .highlighted)
        libraryButtonLabel.setCornerRadius(8.0)
        libraryButtonLabel.setBackgroundColor(Colors.backgroundColorPressed, for: .highlighted)
        libraryButtonLabel.setBackgroundColor(Colors.backgroundColor)
        libraryButtonLabel.setBorderColor(Colors.borderColor)
        libraryButtonLabel.setBorderWidth(1.5, for: .normal, animated: true, animationDuration: 0.2)
        libraryButtonLabel.setBorderWidth(2.0, for: .highlighted, animated: false)
        
        libraryButtonLabel.setShadowColor(UIColor.gray)
        libraryButtonLabel.setShadowRadius(5.0)
        libraryButtonLabel.setShadowOpacity(5.0)
        //libraryButtonLabel.setShadowOffset(20.0 as! CGSize)
        
        libraryButtonLabel.titleLabel?.font = UIFont.medium()
        view.addSubview(libraryButtonLabel)
        
        
        //doneButtonLabel.setBorderWidth(3.0, for: .normal)
        //doneButtonLabel.layer.cornerRadius = doneButtonLabel.frame.size.height/2;
        doneButtonLabel.setBorderColor(Colors.borderColorPressed, for: .highlighted)
        //doneButtonLabel.setCornerRadius(25.0)
        doneButtonLabel.setBackgroundColor(Colors.backgroundColorPressed, for: .highlighted)
        doneButtonLabel.setBackgroundColor(Colors.backgroundColor)
        doneButtonLabel.setBorderColor(Colors.borderColor)
        doneButtonLabel.setBorderWidth(2.5, for: .normal, animated: true, animationDuration: 0.5)
        doneButtonLabel.setBorderWidth(3.5, for: .highlighted, animated: false)
        doneButtonLabel.setCornerRadius(doneButtonLabel.frame.size.height/2)
        
        doneButtonLabel.setShadowColor(UIColor.gray)
        doneButtonLabel.setShadowRadius(5.0)
        doneButtonLabel.setShadowOpacity(5.0)
        
        doneButtonLabel.titleLabel?.font = UIFont.large()
        view.addSubview(doneButtonLabel)
        
        
        
        
        uploadPictureLabel.font = UIFont.medium()
        noteToSaveLabel.font = UIFont.small()
        noteLabel.font = UIFont.medium()
        nameToSaveLabel.font = UIFont.small()
        emailToSaveLabel.font = UIFont.small()
        phoneToSaveLabel.font = UIFont.small()
        websiteToSaveLabel.font = UIFont.small()
    }
    
    
    @IBAction func libraryButtonAction(_ sender: SimpleButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func cameraButtonAction(_ sender: SimpleButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        picToSave.image = image
        self.dismiss(animated: true, completion: nil);
        let imageData = UIImageJPEGRepresentation(picToSave.image!, 0.6)
        let compressedJPEGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPEGImage!, nil, nil, nil)
    }
    
    
    @IBAction func doneButtonAction(_ sender: SimpleButton) {
//        let imageData = UIImageJPEGRepresentation(picToSave.image!, 0.6)
//        let compressedJPEGImage = UIImage(data: imageData!)
//        UIImageWriteToSavedPhotosAlbum(compressedJPEGImage!, nil, nil, nil)
        ///!!!add not to save placeholder to gallery
    }
    
    ///////////////////////////////////////////////////////////
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController : BusinessCardViewController = segue.destination as! BusinessCardViewController
        destViewController.thePic = picToSave.image!
        destViewController.emailText = emailToSaveLabel.text!
        destViewController.phoneText = phoneToSaveLabel.text!
        destViewController.websiteText = websiteToSaveLabel.text!
        destViewController.noteText = noteToSaveLabel.text!
        destViewController.nameText = nameToSaveLabel.text!
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == phoneToSaveLabel {
            
            let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            let components = (newString as NSString).components(separatedBy: NSCharacterSet.decimalDigits.inverted)
            
            let decimalString = components.joined(separator: "") as NSString
            let length = decimalString.length
            let hasLeadingOne = length > 0 && decimalString.character(at: 0) == (1 as unichar)
            
            if length == 0 || (length > 10 && !hasLeadingOne) || length > 11 {
                let newLength = (textField.text! as NSString).length + (string as NSString).length - range.length as Int
                
                return (newLength > 10) ? false : true
            }
            var index = 0 as Int
            let formattedString = NSMutableString()
            
            if hasLeadingOne {
                formattedString.append("1 ")
                index += 1
            }
            if (length - index) > 3 {
                let areaCode = decimalString.substring(with: NSMakeRange(index, 3))
                formattedString.appendFormat("(%@) ", areaCode)
                index += 3
            }
            if length - index > 3 {
                let prefix = decimalString.substring(with: NSMakeRange(index, 3))
                formattedString.appendFormat("%@-", prefix)
                index += 3
            }
            
            let remainder = decimalString.substring(from: index)
            formattedString.append(remainder)
            textField.text = formattedString as String
            return false
            
        } else {
            return true
        }
    }
    

}

