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
    
    
    
    let backgroundColor = UIColor(red: 180/255, green: 204/255, blue: 255/255, alpha: 1)
    let borderColor = UIColor(red: 160/255, green: 177/255, blue: 217/255, alpha: 1)
    let backgroundColorPressed = UIColor(red: 102/255, green: 150/255, blue: 255/255, alpha: 1)
    let borderColorPressed = UIColor(red: 80/255, green: 120/255, blue: 255/255, alpha: 1)

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
        self.hideKeyboardWhenTappedAround()
        
        noteToSaveLabel.layer.cornerRadius = 10;
        picToSave.clipsToBounds = true;
        picToSave.layer.cornerRadius = 20;
        picToSave.layer.cornerRadius = picToSave.frame.size.height/2;
        //****button setup
        //http://aloco.github.io/SimpleButton/swift_output/
        //https://github.com/aloco/SimpleButton
        //****
        
        cameraButtonLabel.setBorderWidth(1.0, for: .normal)
        cameraButtonLabel.setBorderColor(borderColorPressed, for: .highlighted)
        cameraButtonLabel.setCornerRadius(8.0)
        cameraButtonLabel.setBackgroundColor(backgroundColorPressed, for: .highlighted)
        cameraButtonLabel.setBackgroundColor(backgroundColor, for: .normal)
        cameraButtonLabel.setBorderColor(borderColor)
        cameraButtonLabel.setBorderWidth(1.5, for: .normal, animated: true, animationDuration: 0.2)
        cameraButtonLabel.setBorderWidth(2.0, for: .highlighted, animated: false)

        cameraButtonLabel.setShadowColor(UIColor.gray)
        cameraButtonLabel.setShadowRadius(5.0)
        cameraButtonLabel.setShadowOpacity(5.0)
        
        view.addSubview(cameraButtonLabel)

        
        
        
        libraryButtonLabel.setBorderWidth(1.0, for: .normal)
        libraryButtonLabel.setBorderColor(borderColorPressed, for: .highlighted)
        libraryButtonLabel.setCornerRadius(8.0)
        libraryButtonLabel.setBackgroundColor(backgroundColorPressed, for: .highlighted)
        libraryButtonLabel.setBackgroundColor(backgroundColor)
        libraryButtonLabel.setBorderColor(borderColor)
        libraryButtonLabel.setBorderWidth(1.5, for: .normal, animated: true, animationDuration: 0.2)
        libraryButtonLabel.setBorderWidth(2.0, for: .highlighted, animated: false)
        
        libraryButtonLabel.setShadowColor(UIColor.gray)
        libraryButtonLabel.setShadowRadius(5.0)
        libraryButtonLabel.setShadowOpacity(5.0)
        //libraryButtonLabel.setShadowOffset(20.0 as! CGSize)
        
        view.addSubview(libraryButtonLabel)
        
        
        //doneButtonLabel.setBorderWidth(3.0, for: .normal)
        //doneButtonLabel.layer.cornerRadius = doneButtonLabel.frame.size.height/2;
        doneButtonLabel.setBorderColor(borderColorPressed, for: .highlighted)
        //doneButtonLabel.setCornerRadius(25.0)
        doneButtonLabel.setBackgroundColor(backgroundColorPressed, for: .highlighted)
        doneButtonLabel.setBackgroundColor(backgroundColor)
        doneButtonLabel.setBorderColor(borderColor)
        doneButtonLabel.setBorderWidth(2.5, for: .normal, animated: true, animationDuration: 0.5)
        doneButtonLabel.setBorderWidth(3.5, for: .highlighted, animated: false)
        doneButtonLabel.setCornerRadius(doneButtonLabel.frame.size.height/2)
        
        doneButtonLabel.setShadowColor(UIColor.gray)
        doneButtonLabel.setShadowRadius(5.0)
        doneButtonLabel.setShadowOpacity(5.0)
        
        view.addSubview(doneButtonLabel)
        
        // Do any additional setup after loading the view, typically from a nib.
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
        
    }
    
    

}

