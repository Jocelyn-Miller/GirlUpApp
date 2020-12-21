//
//  contactCell.swift
//  Girl Up APP
//
//  Created by Jocelyn Miller on 12/10/20.
//

import UIKit
import MessageUI


class contactCell: UITableViewCell, MFMailComposeViewControllerDelegate
{
var contact = Contact(name: "jerry", number: 2674756824, Email: "joeymmiller@gmail.com")
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func callPolice(_ sender: UIButton)
    {
        if let phoneCallURL = URL(string: "tel://\(contact.number)") {
        
        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(phoneCallURL)) {
            application.open(phoneCallURL, options: [:], completionHandler: nil)
        }
      }
        print(contact.number)
    }
    
    
    @IBAction func sendEmail(_ sender: UIButton)
    {
        if MFMailComposeViewController.canSendMail()
        {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["\(contact.Email)"])
            mail.setMessageBody("<p>test complete</p>", isHTML: true)

            //present(mail, animated: true)
        } else {
            let alertWin = UIAlertController(title: "email send failed", message: nil, preferredStyle: .alert)
           alertWin.addAction(UIAlertAction(title: NSLocalizedString("fork", comment: "Default action"), style: .default, handler: { _ in
           NSLog("The \"OK\" alert occured.")
           }))
            //self.present(alertWin, animated: true, completion: nil)
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
        {
            controller.dismiss(animated: true)
        }
    
        //print(contact.Email)
    }

}
