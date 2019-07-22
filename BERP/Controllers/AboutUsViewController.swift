//
//  AboutUsViewController.swift
//  BERP
//
//  Created by Das Tarlochan Preet Singh on 2019-07-22.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func actionGoToHome(_ sender: Any)
    {
        self.dismiss(animated: true, completion: {})
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
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
