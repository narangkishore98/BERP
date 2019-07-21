//
//  ViewEnterpriseTableViewController.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-20.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class ViewEnterpriseTableViewController: UITableViewController {

    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "My Enterprises"
        
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(sendToAddEnterprise))
        
        self.navigationItem.rightBarButtonItem =  addBarButton

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc func sendToAddEnterprise()
    {
        let storyboard = UIStoryboard(name: "Owner", bundle: nil)
        let addEnterpriseVC = storyboard.instantiateViewController(withIdentifier: "addEnterpriseVC")
        self.navigationController?.pushViewController(addEnterpriseVC, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        return delegate.loggedInOwner!.getAllEnterprises().count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellForViewEnterprise", for: indexPath)
        let delegate = UIApplication.shared.delegate as! AppDelegate
        cell.textLabel!.text = delegate.loggedInOwner!.getAllEnterprises()[indexPath.row].enterpriseName

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let storyboard = UIStoryboard(name: "Owner", bundle: nil)
        delegate.selectedEnterpriseForDetailByOwner = delegate.loggedInOwner?.getAllEnterprises()[indexPath.row]
        let showEnterpriseDetailVC = storyboard.instantiateViewController(withIdentifier: "showEnterpriseDetailVC")
        self.navigationController?.pushViewController(showEnterpriseDetailVC, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
