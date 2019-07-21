//
//  AddEmployeeViewController.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-21.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class AddEmployeeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(addEmployee))
        
        self.navigationItem.rightBarButtonItem = doneButton
        self.navigationItem.title = "Add Employee"
        // Do any additional setup after loading the view.
    }
    
    @objc func addEmployee()
    {
        
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
