//
//  AddProductViewController.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-21.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class AddProductViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return types[row]
    }
    var types = ["\(ProductType.Bakery)","\(ProductType.Beverages)","\(ProductType.Dairy)","\(ProductType.Dairy)","\(ProductType.Food)","\(ProductType.Organic)"]
    @IBOutlet weak var txtBarcode: UITextField!
    @IBOutlet weak var txtPType: UITextField!
    @IBOutlet weak var productDescription: UITextField!
    @IBOutlet weak var txtPName: UITextField!
    @IBOutlet weak var txtPPrice: UITextField!
    var pickerView = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pickerView.dataSource = self
        pickerView.delegate = self
        txtPType.inputView = pickerView
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
        txtPType.inputAccessoryView = toolBar
        
        
        
        
        let addEnterpriseDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(addEnterpriseDoneAction))
        
        self.navigationItem.rightBarButtonItem = addEnterpriseDone
        
    }
    
    @objc func addEnterpriseDoneAction()
    {
        if(txtPType.text == "" || txtPName.text == "" || txtPPrice.text == "" || txtBarcode.text == "" || productDescription.text == "")
        {
            let alertController = UIAlertController(title: "Error", message: "Please Fill All the values.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
        else if Float(txtPPrice.text!) == nil || Int(txtBarcode.text!) == nil
        {
            let alertController = UIAlertController(title: "Error", message: "Please Fill All the values in correct Format.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
        else
        {
            
            
            let delegate = UIApplication.shared.delegate as! AppDelegate
            let enterprise = delegate.selectedEnterpriseForDetailByOwner
            let product = Product(name: txtPName.text!, barcode: txtBarcode.text!, description: productDescription.text!,  price: (txtPPrice.text! as NSString).floatValue, productType: getProductType(txtPType.text!))
            enterprise?.addProduct(product: product)
            self.navigationController?.popViewController(animated: true)
            
        }
    }
    
    func getProductType(_ from:String) -> ProductType
    {
        switch from {
        case "Bakery":
            return .Bakery
        case "Beverages":
            return .Beverages
        case "Dairy":
            return .Dairy
        case "Food":
            return .Food
        case "Organic":
            return .Organic
        default:
            return .Bakery
        }
    }

    @objc func doneClick() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "dd-MM-YY"
        txtPType.text = types[pickerView.selectedRow(inComponent: 0)]
        txtPType.resignFirstResponder()
    }
    @objc func cancelClick() {
        txtPType.resignFirstResponder()
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
