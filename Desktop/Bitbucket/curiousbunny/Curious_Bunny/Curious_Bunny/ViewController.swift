//
//  ViewController.swift
//  Curious_Bunny
//
//  Created by Komal Gujarathi on 6/12/17.
//  Copyright © 2017 Komal Gujarathi. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet var password: UITextField!
    @IBOutlet var email: UITextField!
    let launchPage = "launchPage"
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background1.png")!)
   /*
        Auth.auth().addStateDidChangeListener(){ auth,user in
            if user != nil{
                print("User found and Successfully Logged in")
                self.performSegue(withIdentifier: self.launchPage, sender: nil)
            }else{
                print("User not properly logged in")
            }
        }
    */
    }

    @IBAction func loginTapped(_ sender : AnyObject){
        print("\(email.text!)")
        print("\(password.text!)")
        
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                print("No need to perform segue")
                //self.performSegue(withIdentifier: "registerSegue", sender: self)
                
            }
            else if let user = user {
                print(user)
                print("Performing segue")
                self.performSegue(withIdentifier: "launchPage", sender: self)
            }
        }
            
        
    }
    
    @IBAction func backgroundTapped(_ sender : AnyObject){
        self.view.endEditing(true)
    }
  
}

