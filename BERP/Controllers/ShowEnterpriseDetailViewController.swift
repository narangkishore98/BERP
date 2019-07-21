//
//  ShowEnterpriseDetailViewController.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-20.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class ShowEnterpriseDetailViewController: UIViewController {

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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBonusMultiplier(_ sender: Any) {
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
