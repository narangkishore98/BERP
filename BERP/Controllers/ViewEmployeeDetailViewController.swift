//
//  ViewEmployeeDetailViewController.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-21.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class ViewEmployeeDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate!.selectedEnterpriseForDetailByOwner!.getOrdersOfEmployee(with: delegate!.selectedEmployeeForDetailByOwner!).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cellForOrder")
        
        cell?.textLabel!.text = "\(delegate!.selectedEnterpriseForDetailByOwner!.getOrdersOfEmployee(with: delegate!.selectedEmployeeForDetailByOwner!)[indexPath.row])"
        return cell!
        
    }
    

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblBrandName: UILabel!
    @IBOutlet weak var lblWorkingLocation: UILabel!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    var delegate:AppDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Employee Details"
        
        tblView.delegate = self
        tblView.dataSource = self
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
