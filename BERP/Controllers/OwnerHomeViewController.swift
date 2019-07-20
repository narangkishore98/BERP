//
//  OwnerHomeViewController.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-19.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class OwnerHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tblMenu: UITableView!
    var owner:Owner?
  
    var homeMenuOptions = ["View My Enterprises", "Add New Enterprise","Delete Enterprise"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeMenuOptions.count
    }
    
    @IBOutlet weak var navbar: UINavigationItem!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblMenu.dequeueReusableCell(withIdentifier: "cellForMenuOptions")!
        cell.textLabel!.text = homeMenuOptions[indexPath.row]
        cell.tag = indexPath.row
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row
        {
        case 0:
            if owner?.getAllEnterprises().count == 0
            {
                let alert = UIAlertController(title: "No Enterprises Available", message: "No Enterprises available to show. Please add a enterprise to start.", preferredStyle: .alert)
                let actionButton = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(actionButton)
                self.present(alert, animated: true)
            }
            else
            {
                let storyboard = UIStoryboard(name: "Owner", bundle: nil)
                let viewEnterpriseVC = storyboard.instantiateViewController(withIdentifier: "viewEnterpriseVC")
                print("HELLO")
                
                self.navigationController?.pushViewController(viewEnterpriseVC, animated: true)
            }
        case 1:
            let storyboard = UIStoryboard(name: "Owner", bundle: nil)
            let addEnterpriseVC = storyboard.instantiateViewController(withIdentifier: "addEnterpriseVC")
            print("HELLO")
        
           self.navigationController?.pushViewController(addEnterpriseVC, animated: true)
        default:
            print("Nothing is being done here")
        }
    }
    
    @IBOutlet weak var lblWelcome: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMenu.delegate = self
        tblMenu.dataSource = self
  
        let delegate = UIApplication.shared.delegate as? AppDelegate
        owner = delegate?.loggedInOwner
        lblWelcome.text = "Welcome, \(delegate!.loggedInOwner!.fullName)"
   
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
