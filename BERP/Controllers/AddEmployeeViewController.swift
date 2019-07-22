//
//  AddEmployeeViewController.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-21.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class AddEmployeeViewController: UIViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(addEmployee))
        
        self.navigationItem.rightBarButtonItem = doneButton
        self.navigationItem.title = "Add Employee"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func txtEmpAddress(_ sender: Any) {
    }
    @IBOutlet weak var txtEmpEmail: UITextField!
    @IBOutlet weak var txtEmpAddress: UITextField!
    @IBOutlet weak var txtEmpName: UITextField!
    @objc func addEmployee()
    {
        if txtEmpName.text == "" || txtEmpEmail!.text == "" || txtEmpAddress.text == ""
        {
            let alertController = UIAlertController(title: "Error", message: "Please Fill All the values.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
        else if txtEmpEmail!.text!.isValidEmail()
        {
            let alertController = UIAlertController(title: "Error", message: "Invalid Email.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
        else
        {
            let password:String = "\(Int.random(in: 1000...9999))"
            let employee = Employee(fullName: txtEmpName.text!, email: txtEmpEmail.text!, password: password, address: txtEmpAddress.text!)
            
            let delegate = UIApplication.shared.delegate as! AppDelegate
            delegate.selectedEnterpriseForDetailByOwner?.addEmployee(employee: employee)
            DataStore.employees.updateValue(employee, forKey: employee.userID)
            self.navigationController?.popViewController(animated: true)
        }
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
