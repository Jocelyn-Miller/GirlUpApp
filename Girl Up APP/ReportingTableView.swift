//
//  ReportingTableView.swift
//  Girl Up APP
//
//  Created by Jocelyn Miller on 12/8/20.
//

import UIKit
import MessageUI

class ReportingTableView: UIViewController, UITableViewDelegate,  UITableViewDataSource, MFMailComposeViewControllerDelegate, customDelegate
{
    var incidentComplete = UserDefaults.standard.string(forKey: "completeIncident")

    func call(number: Int)
    {
        print("call \(number)")
        if let phoneCallURL = URL(string: "tel://\(number)") {
        
        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(phoneCallURL)) {
            application.open(phoneCallURL, options: [:], completionHandler: nil)
        }
      }

    }
    
    func email(email: String)
    {
        if MFMailComposeViewController.canSendMail()
        {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["\(email)"])
            mail.setMessageBody("<p> \(incidentComplete) </p>", isHTML: true)

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
    
    @IBOutlet weak var myTableView: UITableView!
     var contacts = [Contact]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return contacts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! contactCell
        cell.contact = contacts[indexPath.row]
        cell.textLabel?.text = cell.contact.name
        cell.delegate = self
        
        return cell
    }
    
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        //myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        myTableView.delegate = self
        //self.view = myTableView
        
        let pell = Contact(name: "Mrs. Pellicane", number: 6108535900, Email: "lpellicane@haverfordsd.net")
        let vindler = Contact(name: "Mrs. Vindler", number: 6108535900, Email: "kvindler@haverfordsd.net")
        let costanzo = Contact(name: "Mrs. Costanzo", number: 6108535900, Email: "ccostanzo@haverfordsd.net")
        let williams = Contact(name: "Mrs. Williams", number: 6108535900, Email: "mwilliams@haverfordsd.net")
        let alderfer = Contact(name: "Mrs. Alderfer", number: 6108535900, Email: "aalderfer@haverfordsd.net")
        let jones = Contact(name: "Mrs. Jones", number: 6108535900, Email: "kjones@haverfordsd.net")
        let police = Contact(name: "Police", number: 6108531298, Email: "Info@Havpd.org")
        
        contacts.append(police)
        
        contacts.append(pell)
        contacts.append(vindler)
        contacts.append(costanzo)
        contacts.append(williams)
        contacts.append(alderfer)
        contacts.append(jones)

        
        
        // Do any additional setup after loading the view.
    }
    
    

}
