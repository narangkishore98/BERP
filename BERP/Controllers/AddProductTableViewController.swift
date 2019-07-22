//
//  AddProductTableViewController.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-22.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class AddProductTableViewController: UITableViewController {

    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return delegate.loggedInEmployee!.workingIn.getAllProducts().count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellForProduct", for: indexPath)

        cell.textLabel!.text = " \(delegate.loggedInEmployee!.workingIn.getAllProducts()[indexPath.row].name) - \(delegate.loggedInEmployee!.workingIn.getAllProducts()[indexPath.row].productID)"
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Add Product", message: "Enter The Product Count", preferredStyle: .alert)
        alert.addTextField { (txtField) in
            txtField.placeholder = "Product Qty."
            txtField.keyboardType = .numberPad
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            [weak alert] (_) in
            
            if alert!.textFields![0].text! == ""
            {
                let error = UIAlertController(title: "Error", message: "Please Choose a valid qty.", preferredStyle: .alert)
                error.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            }
            else if let numberOfTimes = Int(alert!.textFields![0].text!)
            {
                for _ in 0..<numberOfTimes
                {
                    self.delegate.productsInOrder.append((self.delegate.loggedInEmployee?.workingIn.getAllProducts()[indexPath.row])!)
                    
                   }
                self.navigationController?.popViewController(animated: true)
            
            }
            else
            {
                self.delegate.productsInOrder.append((self.delegate.loggedInEmployee?.workingIn.getAllProducts()[indexPath.row])!)
                self.navigationController?.popViewController(animated: true)
            }
        }))
        self.present(alert, animated: true)
        
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
