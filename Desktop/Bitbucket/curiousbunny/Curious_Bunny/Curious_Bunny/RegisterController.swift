//
//  RegisterController.swift
//  Curious_Bunny
//
//  Created by Komal Gujarathi on 6/13/17.
//  Copyright © 2017 Komal Gujarathi. All rights reserved.
//

import Foundation
import UIKit
import Firebase
class RegisterController: UIViewController {
    
    
    @IBOutlet var registerConfirmPassword: UITextField!
    
    @IBOutlet var registerPassword: UITextField!
    @IBOutlet var registerEmail: UITextField!
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background1.png")!)
        navigationItem.hidesBackButton = true
    }

    @IBAction func registerTapped(_ sender : AnyObject){
        print("Email: \(registerEmail.text!)")
        print("Password: \(registerPassword.text!)")
        
        print("Trying to register")

        Auth.auth().createUser(withEmail: registerEmail.text!,
                               password: registerPassword.text!) { user, error in
                                if let error = error {
                                    print(error.localizedDescription)
                                }
                                else if let user = user{
                                    print(user)
                                    self.performSegue(withIdentifier: "loginPage", sender: self)
                                }
        }
        
    }

    @IBAction func backgroundTapped(_ sender : AnyObject){
        self.view.endEditing(true)
    }
}
