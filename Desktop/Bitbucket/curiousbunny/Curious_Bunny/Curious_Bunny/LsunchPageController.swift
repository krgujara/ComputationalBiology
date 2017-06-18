//
//  LsunchPageController.swift
//  Curious_Bunny
//
//  Created by Komal Gujarathi on 6/15/17.
//  Copyright © 2017 Komal Gujarathi. All rights reserved.
//

import UIKit
import Firebase
class LaunchPageController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        print("Launch Page Opened")
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func logout(_ sender: Any) {
        print("Log out pressed")
     
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("Successfully logged out")
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    @IBAction func takePictures(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
        }else{
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.delegate = self
        present(imagePicker,animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //get picked image from info dictionary
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        print("info \(image)")
        
        //put that image on screen in the image view
        imageView.image = image
        dismiss(animated: true, completion: nil)
 
        //let imageData = UIImagePNGRepresentation(ImageDisplay.image)
       // let data: NSData = UIImageJPEGRepresentation(image, 0.9)! as NSData
       // print("Data \(data)")
    
        let analyzeImage = CognitiveServices.sharedInstance.analyzeImage
        analyzeImage.delegate = self as? AnalyzeImageDelegate
        
        let visualFeatures: [AnalyzeImage.AnalyzeImageVisualFeatures] = [.Categories, .Description, .Faces, .ImageType, .Color, .Adult]
        let requestObject: AnalyzeImageRequestObject = (imageView.image!, visualFeatures)
        
        try! analyzeImage.analyzeImageWithRequestObject(requestObject, completion: { (response) in
            //print("response\(String(describing: response?.descriptionText))")
            DispatchQueue.main.async(execute: {
                print("\(String(describing: response?.descriptionText!))")
            })
        })
        
        
    }
    
    

    @IBAction func takepicture(_sender: Any){
        print("Button Clicked")
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
        }else{
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.delegate = self
        present(imagePicker,animated: true, completion: nil)
        
    }
}







