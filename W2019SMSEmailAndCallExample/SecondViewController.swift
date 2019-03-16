//
//  SecondViewController.swift
//  W2018SMSEmailAndCallExample
//
//  Created by moxDroid on 2019-03-15.
//  Copyright © 2019 moxDroid. All rights reserved.
//

import UIKit
import MessageUI

class SecondViewController: UIViewController, MFMailComposeViewControllerDelegate {
   
    @IBOutlet weak var edtBody: UITextField!
    @IBOutlet weak var edtSubject: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSendEmail(_ sender: UIBarButtonItem)
    {
        
        if MFMailComposeViewController.canSendMail()
        {
            print("Email Configured")
            let emailVC = MFMailComposeViewController()
            emailVC.mailComposeDelegate = self
            emailVC.setSubject(edtSubject.text!)
            emailVC.setMessageBody(edtBody.text!, isHTML: true)
            
            present(emailVC, animated: true, completion: nil)
        }
        else{
            print("No Email Configured")
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
    {
         dismiss(animated: true, completion: nil)
    }
}

