//
//  FirstViewController.swift
//  W2018SMSEmailAndCallExample
//
//  Created by moxDroid on 2019-03-15.
//  Copyright © 2019 moxDroid. All rights reserved.
//

import UIKit
import MessageUI

class FirstViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSMSSend(_ sender: UIButton) {
        if MFMessageComposeViewController.canSendText() {
            
            
            let messageVC = MFMessageComposeViewController()
            
            messageVC.body = "Hello, How are you?"
            messageVC.recipients = ["+11234567890"]
            messageVC.messageComposeDelegate = self
            
            self.present(messageVC, animated: false, completion: nil)
        }
        else{
            print("NO SIM available")
        }
    }
    
    @IBAction func btnMakeCall(_ sender: UIButton) {
        if let url = URL(string: "tel://+1123777777)"), UIApplication.shared.canOpenURL(url){
            if #available(iOS 10, *)
            {
                UIApplication.shared.open(url)
            }
            else
            {
                UIApplication.shared.openURL(url)
            }
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
}

