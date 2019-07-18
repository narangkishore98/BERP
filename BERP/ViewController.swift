//
//  ViewController.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-17.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var switchRememberMe: UISwitch!
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func actionLogin(_ sender: Any)
    {
        let myEmail : String = self.txtEmail.text!
        let myPassword : String = self.txtPassword.text!
        if (EmptyValidation(email: myEmail, password: myPassword) == false)
        {
            //Email and Password fields not empty ->has value
            
        }
        else
        {
            //Email and Password Fields Left empty by user and clicked on Login
            showMyAlertMessage(title: "Message", message: "Email and Password are Empty.. Try Again", btnTitle: "Ok")
        }
    }
    @IBAction func actionRegister(_ sender: Any)
    {
        
    }
    
    //validation to check if user left email and password empty and directly clicked on Login -> to prevent crash
    func EmptyValidation(email : String , password : String) -> Bool
    {
        if (email.isEmpty && password.isEmpty)
        {
            //Email and password fields are left Empty by User
            return true
        }
        return false
    }
    
    // Remember Me Code -> User Default
    private func getRememberMeValues()
    {
        let userDefault = UserDefaults.standard
        
        if let email = userDefault.string(forKey: "userEmail")
        {
            txtEmail.text = email
            
            if let pwd = userDefault.string(forKey: "userPassword")
            {
                txtPassword.text = pwd
            }
        }
        switchRememberMe.setOn(true, animated: true)
    }
    
    //Function Made for Custom Alert Action
    public func showMyAlertMessage(title : String , message : String , btnTitle : String)
    {
        let alertControl = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionButton = UIAlertAction(title: btnTitle, style: .default, handler: nil)
        alertControl.addAction(actionButton)
        self .present(alertControl , animated: true , completion: nil)
    }

    //Un Wind used for Logout from any screen
    @IBAction func unWindLogoutFromAnyScreen(storyboardSegue: UIStoryboardSegue)
    {
        let s = storyboardSegue.source as! AboutUsViewController  // just temporary code -> Change Later
        if(switchRememberMe.isOn)
        {
            getRememberMeValues()
        }
        else
        {
            txtPassword.text = ""
            txtEmail.text = ""
        }
        print("Logout")
    }
}

