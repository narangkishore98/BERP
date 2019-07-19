//
//  SmsCallViewController.swift
//  BERP
//
//  Created by Das Tarlochan Preet Singh on 2019-07-19.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit
import MessageUI
class SmsCallViewController: UIViewController ,MFMessageComposeViewControllerDelegate
{
    
    

    @IBOutlet weak var txtMessage: UITextView!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionCall(_ sender: Any)
    {
        if let url = URL(string: "tel://+16477639826)"), UIApplication.shared.canOpenURL(url){
            if #available(iOS 10, *)
            {
                UIApplication.shared.open(url)
            }
            else
            {
                UIApplication.shared.openURL(url)
            }
        }    }
    
    @IBAction func actionSMS(_ sender: Any)
    {
        if MFMessageComposeViewController.canSendText() {
            
            
            let messageVC = MFMessageComposeViewController()
            
            messageVC.body = txtMessage.text!
            messageVC.recipients = ["+16477639826"]
            messageVC.messageComposeDelegate = self
            
            self.present(messageVC, animated: false, completion: nil)
        }
        else{
            print("NO SIM available")
        }
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult)
    {
        switch (result) {
        case .cancelled:
            print("Message was cancelled")
            self.dismiss(animated: true, completion: nil)
        case .failed:
            print("Message failed")
            self.dismiss(animated: true, completion: nil)
        case .sent:
            print("Message was sent")
            self.dismiss(animated: true, completion: nil)
        }
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
