//
//  AboutUsViewController.swift
//  BERP
//
//  Created by Das Tarlochan Preet Singh on 2019-07-18.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit
import WebKit
class InstructionsViewController: UIViewController, WKUIDelegate, WKNavigationDelegate
{
    @IBOutlet weak var wkWebView: WKWebView!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadFromFile()
        wkWebView.uiDelegate = self
        wkWebView.navigationDelegate = self
        // Do any additional setup after loading the view.
    }
    
    //load from url function to load the url in the web view
    func loadFromFile()
    {
        let url = Bundle.main.url(forResource: "instructions", withExtension: "html")
        wkWebView.loadFileURL(url!, allowingReadAccessTo: url!)
        let request = URLRequest(url: url!)
        wkWebView.load(request)
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

