//
//  EmailViewController.swift
//  BERP
//
//  Created by Das Tarlochan Preet Singh on 2019-07-19.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import UIKit
import MessageUI
class EmailViewController: UIViewController, MFMailComposeViewControllerDelegate
{

    
    @IBOutlet weak var txtMessage: UITextView!
    @IBOutlet weak var txtSubject: UITextField!
    @IBOutlet weak var txtSendTo: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionSend(_ sender: Any)
    {
        if MFMailComposeViewController.canSendMail()
        {
            
            let picker = MFMailComposeViewController()
            picker.mailComposeDelegate = self
            picker.setToRecipients([txtSendTo.text!])
            //picker.setPreferredSendingEmailAddress(txtSendTo.text!)
            picker.setSubject(txtSubject.text!)
            picker.setMessageBody(txtMessage.text!, isHTML: true)
            
            present(picker, animated: true, completion: nil)
        }
        
    }
    // MFMailComposeViewControllerDelegate
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult)
    {
        controller.dismiss(animated: true, completion: nil)
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
