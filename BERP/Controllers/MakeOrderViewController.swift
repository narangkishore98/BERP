//
//  MakeOrderViewController.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-22.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class MakeOrderViewController: UIViewController {

    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblTotalItems: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let addProduct = UIBarButtonItem(title: "Add Product", style: .plain, target: self, action: #selector(goToAddProduct))
        
        self.navigationItem.rightBarButtonItem = addProduct
        // Do any additional setup after loading the view.
    }
    
    
    @objc func goToAddProduct()
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
