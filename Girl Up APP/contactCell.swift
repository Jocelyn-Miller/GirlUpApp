//
//  contactCell.swift
//  Girl Up APP
//
//  Created by Jocelyn Miller on 12/10/20.
//

import UIKit
import MessageUI
protocol customDelegate
{
    func call(number: Int)
    func email(email: String)
}


class contactCell: UITableViewCell, MFMailComposeViewControllerDelegate
{
    var delegate: customDelegate?
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
        delegate?.call(number: contact.number)
    }
    
    
    @IBAction func sendEmail(_ sender: UIButton)
    {
        delegate?.email(email: "\(contact.Email)")
    }

}
