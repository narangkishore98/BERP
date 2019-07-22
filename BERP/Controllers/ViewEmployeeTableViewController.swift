//
//  ViewEmployeeTableViewController.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-21.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class ViewEmployeeTableViewController: UITableViewController {

    var delegate:AppDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Employees"
        let addEmployeeBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(sendToAddEmployee))
        self.navigationItem.rightBarButtonItem = addEmployeeBarButton
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.delegate = (UIApplication.shared.delegate as! AppDelegate)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    

    @objc func sendToAddEmployee()
    {
        let storyboard = UIStoryboard(name: "Owner", bundle: nil)
        let addEmployeeVC = storyboard.instantiateViewController(withIdentifier: "addEmployeeVC")
        self.navigationController?.pushViewController(addEmployeeVC, animated: true)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (delegate?.selectedEnterpriseForDetailByOwner!.getEmployees().count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel!.text = "\(delegate!.selectedEnterpriseForDetailByOwner!.getEmployees()[indexPath.row].fullName) - \(delegate!.selectedEnterpriseForDetailByOwner!.getEmployees()[indexPath.row].userID)"
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.selectedEmployeeForDetailByOwner = delegate?.selectedEnterpriseForDetailByOwner?.getEmployees()[indexPath.row]
        let storyboard = UIStoryboard(name: "Owner", bundle: nil)
        let viewEmployeeDetailVC = storyboard.instantiateViewController(withIdentifier: "viewEmployeeDetailVC")
        self.navigationController?.pushViewController(viewEmployeeDetailVC, animated: true)
        
        
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
