//
//  emotionalResources.swift
//  Girl Up APP
//
//  Created by Jocelyn Miller on 11/10/20.
//

import UIKit
import MessageUI

class emotionalResources: UIViewController, MFMailComposeViewControllerDelegate
{
    
var phoneNumber = 4849038439
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // guidance emails
        
        // aalderfer@haverfordsd.net
        // ccostanzo@haverfordsd.net
        // pdayl@haverfordsd.net
        //kjones@haverfordsd.net
        //lpellicane@haverfordsd.net
        //kvindler@haverfordsd.net
        //mwilliams@haverfordsd.net

        //therapy options
        //24/7 crisis hotline
        
        //sexual assualt hotline
        // 1-800-656-4673

        // Do any additional setup after loading the view.
    }
    

    @IBAction func callCell(_ sender: UIButton)
    {
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
        
        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(phoneCallURL)) {
            application.open(phoneCallURL, options: [:], completionHandler: nil)
        }
      }
        
    }
    
    @IBAction func sendMail(_ sender: UIButton)
    {
            if MFMailComposeViewController.canSendMail()
            {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["joeymmiller@gmail.com"])
                mail.setMessageBody("<p>Test Complete!</p>", isHTML: true)

                present(mail, animated: true)
            } else {
                let alertWin = UIAlertController(title: "email send failed", message: nil, preferredStyle: .alert)
               alertWin.addAction(UIAlertAction(title: NSLocalizedString("fork", comment: "Default action"), style: .default, handler: { _ in
               NSLog("The \"OK\" alert occured.")
               }))
                self.present(alertWin, animated: true, completion: nil)
            }
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
        {
            controller.dismiss(animated: true)
        }
    
    
}
