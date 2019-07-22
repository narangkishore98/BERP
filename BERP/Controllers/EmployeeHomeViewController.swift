//
//  EmployeeHomeViewController.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-21.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class EmployeeHomeViewController: UIViewController {

    @IBOutlet weak var optionToChoose: UISegmentedControl!
    @IBOutlet weak var lblWorkingFor: UILabel!
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblAt: UILabel!
    let delegate = UIApplication.shared.delegate as? AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        lblWelcome.text = "Welcome \(delegate!.loggedInEmployee?.fullName)"
        
        lblWorkingFor.text = delegate!.loggedInEmployee!.workingIn.enterpriseName
        
        lblAt.text = delegate!.loggedInEmployee!.workingIn.address
        // Do any additional setup after loading the view.
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
