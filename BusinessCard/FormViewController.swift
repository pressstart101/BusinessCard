//
//  ViewController.swift
//  BusinessCard
//
//  Created by walter scott on 12/4/16.
//  Copyright © 2016 mk. All rights reserved.
//

import UIKit

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
    
    
    
    let backgroundColor = UIColor(red: 179/255, green: 204/255, blue: 230/255, alpha: 1)
    let borderColor = UIColor(red: 140/255, green: 177/255, blue: 217/255, alpha: 1)
    let backgroundColorPressed = UIColor(red: 121/255, green: 164/255, blue: 210/255, alpha: 1)
    let borderColorPressed = UIColor(red: 64/255, green: 125/255, blue: 191/255, alpha: 1)

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        cameraButtonLabel.setBorderWidth(3.0, for: .highlighted, animated: false)

        
        view.addSubview(cameraButtonLabel)

        
        
        
        libraryButtonLabel.setBorderWidth(1.0, for: .normal)
        libraryButtonLabel.setBorderColor(borderColorPressed, for: .highlighted)
        libraryButtonLabel.setCornerRadius(8.0)
        libraryButtonLabel.setBackgroundColor(backgroundColorPressed, for: .highlighted)
        libraryButtonLabel.setBackgroundColor(backgroundColor)
        libraryButtonLabel.setBorderColor(borderColor)
        libraryButtonLabel.setBorderWidth(1.5, for: .normal, animated: true, animationDuration: 0.2)
        libraryButtonLabel.setBorderWidth(3.0, for: .highlighted, animated: false)
        
        
        view.addSubview(libraryButtonLabel)
        
        
        //doneButtonLabel.setBorderWidth(3.0, for: .normal)
        doneButtonLabel.setBorderColor(borderColorPressed, for: .highlighted)
        doneButtonLabel.setCornerRadius(25.0)
        doneButtonLabel.setBackgroundColor(backgroundColorPressed, for: .highlighted)
        doneButtonLabel.setBackgroundColor(backgroundColor)
        doneButtonLabel.setBorderColor(borderColor)
        doneButtonLabel.setBorderWidth(2.5, for: .normal, animated: true, animationDuration: 0.5)
        doneButtonLabel.setBorderWidth(4.5, for: .highlighted, animated: false)
        
        
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
    }
    
    
    @IBAction func doneButtonAction(_ sender: SimpleButton) {
        let imageData = UIImageJPEGRepresentation(picToSave.image!, 0.6)
        let compressedJPEGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPEGImage!, nil, nil, nil)
    }
    
    ///////////////////////////////////////////////////////////
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var destViewController : BusinessCardViewController = segue.destination as! BusinessCardViewController
//        destViewController.nameText = nameToSaveLabel.text!
//        
//    }
    
    

}

