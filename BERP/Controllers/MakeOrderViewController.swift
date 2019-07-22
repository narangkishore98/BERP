//
//  MakeOrderViewController.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-22.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class MakeOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate.productsInOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblOrderList.dequeueReusableCell(withIdentifier: "cellForProduct")
        
        cell?.textLabel!.text = "\(indexPath.row) - \(delegate.productsInOrder[indexPath.row].name)"
        
        cell?.detailTextLabel!.text = delegate.productsInOrder[indexPath.row].price.dollar()
        
        return cell!
    }
    

    @IBOutlet weak var tblOrderList: UITableView!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblTotalItems: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let addProduct = UIBarButtonItem(title: "Add Product", style: .plain, target: self, action: #selector(goToAddProduct))
        
        self.navigationItem.rightBarButtonItem = addProduct
        
        tblOrderList.delegate = self
        tblOrderList.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        tblOrderList.reloadData()
        var amount:Float = 0.0
        for product in delegate.productsInOrder
        {
            amount += product.price
        }
        lblAmount.text = amount.dollar()
        lblTotalItems.text = "\(delegate.productsInOrder.count)"
    }
    @objc func goToAddProduct()
    {
        let storyboard = UIStoryboard(name: "Employee", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "addProductVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func placeOrder(_ sender: Any) {
        
        let order = Order(products: delegate.productsInOrder, madeBy: delegate.loggedInEmployee!, discount: nil)
        
        order.dateTime = Date()
        delegate.loggedInEmployee?.workingIn.addOrder(order: order)
        
        
        delegate.productsInOrder.removeAll()
        self.navigationController?.popViewController(animated: true)
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
