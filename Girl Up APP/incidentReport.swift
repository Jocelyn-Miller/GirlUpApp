//
//  incidentReport.swift
//  Girl Up APP
//
//  Created by Jocelyn Miller on 11/24/20.
//

import UIKit

class incidentReport: UIViewController
{
    //var completeIncident = ""
 var completeIncident = UserDefaults.standard.string(forKey: "completeIncident")
    
    @IBOutlet weak var cellTextField: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var profileTextField: UITextField!
    @IBOutlet weak var incidentTextField: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        view.endEditing(true)
    }
    
    func compileIncidentReport()
    {
        var name = nameTextField.text ?? "not listed"
        var cell = cellTextField.text ?? "not listed"
        var address = addressTextField.text ?? "not listed"
        var date = dateTextField.text ?? "not listed"
        var time = timeTextField.text ?? "not listed"
        var profile = profileTextField.text ?? "not listed"
        var incident = incidentTextField.text ?? "not listed"
        
        completeIncident = "The following is an unoffical incident report completed voluntarily: \n Name: \(name) \n Cell: \(cell) \n Address: \(address) Date of incident: \(date) Time of Incident: \(time) Profile: \(profile) Incident Summary: \(incident)"
        
        UserDefaults.standard.set(completeIncident, forKey: "completeIncident")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        compileIncidentReport()
    }
    
}
