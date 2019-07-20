//
//  AddEnterpriseViewController.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-19.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class AddEnterpriseViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let types = ["MegaMart","Restaurant", "Store"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return "\(EnterpriseType.MegaMart)"
        case 1:
            return "\(EnterpriseType.Restaurant)"
        case 2:
            return "\(EnterpriseType.Store)"
        default:
            return ""
        }
    }
    

    var owner:Owner?
    @IBOutlet weak var txtEName: UITextField!
    @IBOutlet weak var txtEType: UITextField!
    var typePicker:UIPickerView = UIPickerView()
    @IBOutlet weak var txtEAddress: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typePicker.delegate = self
        typePicker.dataSource = self
        owner = (UIApplication.shared.delegate as? AppDelegate)!.loggedInOwner
    txtEType.inputView = typePicker
        
        
        //https://iosdevcenters.blogspot.com/2016/03/ios9-uidatepicker-example-with.html
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        txtEType.inputAccessoryView = toolBar
        
        
        
        self.navigationItem.title = "Add Enterprise"
        
        let addEnterpriseDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(addEnterpriseDoneAction))
        self.navigationItem.rightBarButtonItem = addEnterpriseDone
        // Do any additional setup after loading the view.
        
    }
    @objc func addEnterpriseDoneAction()
    {
        if(txtEType.text == "" || txtEName.text == "" || txtEAddress.text == "")
        {
            //show alert here
        }
        else
        {
            let enterprise = Enterprise(name: txtEName.text!, address: txtEAddress.text!, type: getEType(withString: txtEType.text!))
            
            let delegate = UIApplication.shared.delegate as! AppDelegate
            let owner = delegate.loggedInOwner
            owner?.addEnterprise(enterprise: enterprise)
            
        }
    }
    
    func getEType(withString str:String) -> EnterpriseType
    {
        if str == "MegaMart"
        {
            return .MegaMart
        }
        else if str == "Store"
        {
            return .Store
        }
        else if str=="Restaurant"
        {
            return .Restaurant
        }
        else
        {
            return .MegaMart
        }
    }
    @objc func doneClick() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "dd-MM-YY"
        txtEType.text = types[typePicker.selectedRow(inComponent: 0)]
        txtEType.resignFirstResponder()
    }
    @objc func cancelClick() {
        txtEType.resignFirstResponder()
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
