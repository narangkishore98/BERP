//
//  RegisterViewController.swift
//  BERP
//
//  Created by Das Tarlochan Preet Singh on 2019-07-20.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtFullAddress: UITextField!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionSignUp(_ sender: Any)
    {
        //Empty validation
        if (txtEmail.text!.isEmpty || txtPassword.text!.isEmpty || txtFullName.text!.isEmpty || txtFullAddress.text!.isEmpty)
        {
            //Some fields are left empty by the user and he clicked Sign Up 😐
            showMyAlertMessage(title: "Error", message: "Some Fields are Empty.. Please Fill all the Fields and Try Again..", btnTitle: "Ok")
        }
        else
        {
            //Empty validation Passed successfully 😏
            if(txtEmail.text!.isValidEmail())
            {
                //Email entered is Valid 😏
                //Now Password Validation
                //Password must have at least one uppercase,at least one digit,at least one lowercase and must have atleast 8 characters
                if(txtPassword.text!.isValidPassword())
                {
                    //Password is Strong 🤠
                    //All Validations Passed Now creeate the Owner
                    DataStore.owners.updateValue(Owner(fullName: txtFullName.text!, email: txtEmail.text!, password: txtPassword.text!, address: txtFullAddress.text!), forKey: txtEmail.text!)
                    showMyAlertMessage(title: "Success", message: "Registration Successful..", btnTitle: "Ok")
                }
                else
                {
                    //Password is Weak 😕
                    showMyAlertMessage(title: "Password Error", message: "Entered Password is Weak. Password must have at least one uppercase,one digit, one lowercase and must have atleast 8 characters", btnTitle: "Ok")
                }
            }
            else
            {
                //Email entered is Not Valid ☹️
                showMyAlertMessage(title: "Email Error", message: "Email Entered is Not a Valid Email Address.. Please Try Again.", btnTitle: "Ok")
            }
        }
    }
    //Function Made for Custom Alert Action
    public func showMyAlertMessage(title : String , message : String , btnTitle : String)
    {
        let alertControl = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionButton = UIAlertAction(title: btnTitle, style: .default, handler: nil)
        alertControl.addAction(actionButton)
        self .present(alertControl , animated: true , completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
