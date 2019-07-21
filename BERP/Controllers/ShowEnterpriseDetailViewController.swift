//
//  ShowEnterpriseDetailViewController.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-20.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class ShowEnterpriseDetailViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    var options = ["Add Employees","View Employees","View Orders","Employee Ratings", "Add Products","View Products"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblForMenu.dequeueReusableCell(withIdentifier: "cellForMenuOptions")
        cell?.textLabel?.text = options[indexPath.row]
        return cell!
    }
    

    @IBOutlet weak var txtEAddress: UILabel!
    @IBOutlet weak var txtEName: UILabel!
    @IBOutlet weak var txtEType: UILabel!
    @IBOutlet weak var txtECount: UILabel!
    @IBOutlet weak var txtMaxSale: UILabel!
    @IBOutlet weak var txtEBonusMultiplier: UIButton!
    @IBOutlet weak var txtDetailsFor: UILabel!
    @IBOutlet weak var tblForMenu: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tblForMenu.delegate = self
        tblForMenu.dataSource = self
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        txtDetailsFor.text = "Details For \(delegate.selectedEnterpriseForDetailByOwner!.enterpriseName)"
        txtEName.text = delegate.selectedEnterpriseForDetailByOwner!.enterpriseName
        txtEType.text = "\(delegate.selectedEnterpriseForDetailByOwner!.enterpriseType)"
        txtECount.text = "\(delegate.selectedEnterpriseForDetailByOwner!.employees.count)"
        txtMaxSale.text = "\(delegate.selectedEnterpriseForDetailByOwner!.getMaxIncome())"
        txtEAddress.text = "\(delegate.selectedEnterpriseForDetailByOwner!.address)"
        //txtEBonusMultiplier.currentTitle = "\(delegate.selectedEnterpriseForDetailByOwner!.bonusMultiplier)"
        //txtEBonusMultiplier.titleLabel!.text = delegate.selectedEnterpriseForDetailByOwner?.bonusMultiplier
        //txtEBonusMultiplier.titleLabel!.text = "\(delegate.selectedEnterpriseForDetailByOwner!.bonusMultiplier)"
        
        txtEBonusMultiplier.setTitle("\(delegate.selectedEnterpriseForDetailByOwner!.bonusMultiplier)", for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBonusMultiplier(_ sender: Any) {
            let alert = UIAlertController(title: "Bonus Multiplier", message: "Enter the new bonus Multiplier for Change", preferredStyle: .alert)
        alert.addTextField { (txtField) in
            txtField.placeholder = "New Bonus Multiplier"
            txtField.keyboardType = .numberPad
        }
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            [weak alert] (_) in
            let delegate = UIApplication.shared.delegate as! AppDelegate
            delegate.selectedEnterpriseForDetailByOwner?.bonusMultiplier = Int((alert?.textFields![0].text! as NSString?)!.intValue)
            self.txtEBonusMultiplier.setTitle("\(delegate.selectedEnterpriseForDetailByOwner!.bonusMultiplier)", for: .normal)
        }))
            self.present(alert, animated: true)
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
