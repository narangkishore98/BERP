//
//  AboutUsViewController.swift
//  BERP
//
//  Created by Das Tarlochan Preet Singh on 2019-07-18.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit
import WebKit
class AboutUsViewController: UIViewController
{
    @IBOutlet weak var wkWebView: WKWebView!
    var contactUsUrlString : String? // url for contact us
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadFromUrl()
        // Do any additional setup after loading the view.
    }
    
    //load from url function to load the url in the web view
    func loadFromUrl()
    {
        let url = URL(string: contactUsUrlString!)
        let urlRequest = URLRequest(url: url!)
        self.wkWebView.load(urlRequest)
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

