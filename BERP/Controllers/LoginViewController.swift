//
//  ViewController.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-17.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var switchRememberMe: UISwitch!
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DataStore.readOwnersFromPlist()
        print(DataStore.owners)
    }


    
    @IBAction func actionLogin(_ sender: Any)
    {
        let mytxtEmail : String = self.txtEmail.text!
        let mytxtPassword : String = self.txtPassword.text!
        if (emptyValidation(email: mytxtEmail, password: mytxtPassword) == false)
        {
            //Email and Password fields not empty -> it has value
            if(mytxtEmail.isValidEmail() == true)
            {
                
                if let owner = DataStore.owners[mytxtEmail]
                {
                    if owner.doLogin(password: mytxtPassword)
                    {
                        let delegate = UIApplication.shared.delegate as? AppDelegate
                        delegate?.loggedInOwner = owner
                        
                        //Remember Me code for user Default
                        let userDefault = UserDefaults.standard
                        if switchRememberMe.isOn
                        {
                            
                            userDefault.setValue(txtEmail.text, forKey: "userEmail")
                            userDefault.set(txtPassword.text, forKey: "userPassword")
                        }
                        else
                        {
                            userDefault.removeObject(forKey: "userEmail")
                            userDefault.removeObject(forKey: "userPassword")
                        }
                        
                        let ownerStoryBoard = UIStoryboard(name: "Owner", bundle: nil)
                        let ownerHomeVC = ownerStoryBoard.instantiateViewController(withIdentifier: "startFromOwnerVC")
                        self.present(ownerHomeVC, animated: true)
                       
                    }
                    else
                    {
                        //invalid password
                        //create an action alert here.
                        print("User Invalid Password")
                        showMyAlertMessage(title: "Error", message: "Invalid Password", btnTitle: "Ok")
                    }
                }
                else
                {
                    //user does not exist.
                    //create an action alert here.
                    print("User Doesnot exist")
                    showMyAlertMessage(title: "Error", message: "User Doesnt Exist.. Try Again.", btnTitle: "Ok")
                }
                /*//Email is Valid
                //if let password = MyDataStore.usersDict[myEmail]
                if let password : String = "pass" // temporary valid password of user in database
                {
                    let email : String = "admin@admin.com" // temporary valid email of user in database
                    //User Exist in Database
                    if (password == mytxtPassword)
                    {
                        //Password Correct Entered By User
                        //Remember Me code for user Default
                        let userDefault = UserDefaults.standard
                        if switchRememberMe.isOn
                        {
                            
                            userDefault.setValue(txtEmail.text, forKey: "userEmail")
                            userDefault.set(txtPassword.text, forKey: "userPassword")
                        }
                        else
                        {
                            userDefault.removeObject(forKey: "userEmail")
                            userDefault.removeObject(forKey: "userPassword")
                        }
                        //Everthing Correct -> Show Alert
                        showMyAlertMessage(title: "Message", message: "Details Correctly Entered", btnTitle: "Ok")
                        // TO BE CHANGED MODIFIED LATER
                    }
                    else
                    {
                        //Invalid Password Entered By User
                        showMyAlertMessage(title: "Error", message: "Invalid Password Entered.. Try Again.", btnTitle: "Ok")
                    }
                }
                else
                {
                    //User Doesnt Exist
                    showMyAlertMessage(title: "Error", message: "No User Exist With Specified Email.. try Again.", btnTitle: "Ok")
                }
            */
            }
            else if (mytxtEmail == )
            else
            {
                //Email is Not Valid
                showMyAlertMessage(title: "Error", message: "Invalid Email Entered.. Try Again", btnTitle: "Ok")
            }
 
        }
        else
        {
            //Email and Password Fields Left empty by user and clicked on Login
            showMyAlertMessage(title: "Error", message: "Email and Password Fields are Empty.. Try Again", btnTitle: "Ok")
        }
    }
    @IBAction func actionRegister(_ sender: Any)
    {
        
    }
    
    //validation to check if user left email and password empty and directly clicked on Login -> to prevent crash
    func emptyValidation(email : String , password : String) -> Bool
    {
        if (email.isEmpty && password.isEmpty)
        {
            //Email and password fields are left Empty by User
            return true
        }
        else
        {
            return false
        }
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
        let s = storyboardSegue.source as! OwnerHomeViewController  // just temporary code -> Change Later
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

