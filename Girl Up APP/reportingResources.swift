//
//  reportingResources.swift
//  Girl Up APP
//
//  Created by Jocelyn Miller on 11/10/20.
//

import UIKit
import MessageUI

class reportingResources: UIViewController, MFMailComposeViewControllerDelegate
{
    let PDphoneNumber = 6108531298
    var incidentComplete = UserDefaults.standard.string(forKey: "completeIncident")
    
    override func viewDidLoad()
    {
        incidentComplete = UserDefaults.standard.string(forKey: "completeIncident")
        
        super.viewDidLoad()
       // var completedReport = IncidentReport(theName: <#T##String#>, theAddress: <#T##String#>, theNumber: <#T##Int#>, theTime: <#T##String#>, theProfile: <#T##String#>, theIncident: <#T##String#>, theDate: <#T##String#>)
}
    
    @IBAction func callPolice(_ sender: UIButton)
    {
        if let phoneCallURL = URL(string: "tel://\(PDphoneNumber)") {
        
        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(phoneCallURL)) {
            application.open(phoneCallURL, options: [:], completionHandler: nil)
        }
      }
    }
    

    @IBAction func callAlderfer(_ sender: UIButton)
    {
        makeACall(phoneNumber: 6108535900, extensionNum: 2577)
        //ext 2577
    }
    
    @IBAction func callVindler(_ sender: UIButton)
    {
        makeACall(phoneNumber: 6108535900, extensionNum: 2572)
        //2572
    }
    
    @IBAction func callWilliams(_ sender: UIButton)
    {
        makeACall(phoneNumber: 6108535900, extensionNum: 2575)
        //2575
    }
    
    @IBAction func callPell(_ sender: UIButton)
    {
        makeACall(phoneNumber: 6108535900, extensionNum: 2578)
        //2578
    }
    
    
    @IBAction func callJones(_ sender: UIButton)
    {
        makeACall(phoneNumber: 6108535900, extensionNum: 2576)
        
    }
    
    @IBAction func callCostanzo(_ sender: UIButton)
    {
        makeACall(phoneNumber: 6108535900, extensionNum: 2573)
    }
    
    @IBAction func EmailPolice(_ sender: UIButton)
    {
        sendEmail(email: "Info@Havpd.org")
    }
    
    
    @IBAction func emailAlderfer(_ sender: UIButton)
    {
        sendEmail(email: "aalderfer@haverfordsd.net")
    }
    
    @IBAction func emailVindler(_ sender: UIButton)
    {
        sendEmail(email: "kvindler@haverfordsd.net")
    }
    
    
    @IBAction func emailWilliams(_ sender: UIButton)
    {
        sendEmail(email: "mwilliams@haverfordsd.net")
    }
    
    @IBAction func emailPel(_ sender: UIButton)
    {
        sendEmail(email: "lpellicane@haverfordsd.net")
    }
    
    @IBAction func emailJones(_ sender: UIButton)
    {
        sendEmail(email: "ccostanzo@haverfordsd.net")
    }
    
    @IBAction func emailCostanzo(_ sender: UIButton)
    {
        sendEmail(email: "kjones@haverfordsd.net")
    }
    
    //email 
    func sendEmail(email: String)
 {
        
        if MFMailComposeViewController.canSendMail()
        {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["\(email)"])
            mail.setMessageBody("<p>\(incidentComplete)</p>", isHTML: true)

            present(mail, animated: true)
        } else {
            let alertWin = UIAlertController(title: "email send failed", message: nil, preferredStyle: .alert)
           alertWin.addAction(UIAlertAction(title: NSLocalizedString("fork", comment: "Default action"), style: .default, handler: { _ in
           NSLog("The \"OK\" alert occured.")
           }))
            self.present(alertWin, animated: true, completion: nil)
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
        {
            controller.dismiss(animated: true)
        }
    
 }
    //phone call
    
    func makeACall(phoneNumber: Int, extensionNum: Int)
    {
        let extAlert = UIAlertController(title: "This counselors exention is \(extensionNum)", message: nil, preferredStyle: .alert)
        extAlert.addAction(UIAlertAction(title: NSLocalizedString("okay", comment: "Default action"), style: .default, handler: { _ in
       }))
        
        self.present(extAlert, animated: true, completion: nil)
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
        
        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(phoneCallURL)) {
           application.open(phoneCallURL, options: [:], completionHandler: nil)
        }
      }
        
    }
    


}
