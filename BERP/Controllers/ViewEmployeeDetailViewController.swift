//
//  ViewEmployeeDetailViewController.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-21.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class ViewEmployeeDetailViewController: UIViewController {

    @IBOutlet weak var lblBrandName: UILabel!
    @IBOutlet weak var lblWorkingLocation: UILabel!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    var delegate:AppDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = (UIApplication.shared.delegate as! AppDelegate)
        
        lblBrandName.text = delegate!.selectedEnterpriseForDetailByOwner?.enterpriseName
        
        lblFullName.text = delegate!.selectedEmployeeForDetailByOwner?.fullName
        lblWorkingLocation.text = delegate!.selectedEnterpriseForDetailByOwner?.address
        
        lblEmail.text = delegate!.selectedEmployeeForDetailByOwner!.email
        lblPassword.text = delegate!.selectedEmployeeForDetailByOwner!.password
        
        lblAddress.text = delegate!.selectedEmployeeForDetailByOwner!.address
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
