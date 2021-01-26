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
    var crisisSupportNum = 800273835
    var crisisSupportNumText = 839863
    var hotlineNum = 18006564673
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        

    }

    @IBAction func textCrisis(_ sender: UIButton)
    {
        print("text crisis")
        if let textURL = URL(string: "sms://\(crisisSupportNumText)") {
        
        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(textURL)) {
            application.open(textURL, options: [:], completionHandler: nil)
        }
      }
    }
    
    @IBAction func callCrisis(_ sender: UIButton)
    {
        print("call crisis")
        if let phoneCallURL = URL(string: "tel://\(crisisSupportNum)") {
        
        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(phoneCallURL)) {
            application.open(phoneCallURL, options: [:], completionHandler: nil)
        }
      }
    }
    
    @IBAction func callHotline(_ sender: UIButton)
    {
        print("call hotline")

        if let phoneCallURL = URL(string: "tel://\(hotlineNum)") {
        
        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(phoneCallURL)) {
            application.open(phoneCallURL, options: [:], completionHandler: nil)
        }
      }
    }
    
    
}
