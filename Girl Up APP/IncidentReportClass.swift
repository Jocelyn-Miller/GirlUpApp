//
//  IncidentReportClass.swift
//  Girl Up APP
//
//  Created by Jocelyn Miller on 12/4/20.
//

import Foundation


struct IncidentReport: Codable
{
    //var completedIncidentReport: String
var name: String
var address: String
var number: Int
var date: String
var time: String
var profile: String
var incidentSummary: String
    
    init()
    {
        name = "jocelyn"
        address = "100 haverford road"
        number = 1234456678
        time = "12:00"
        profile = "6', skinny, brown hair, brown eyes wearing green shirt"
        incidentSummary = "tried to follow me from school"
        date = "12/4/20"
    }
    
    init(theName: String, theAddress: String, theNumber: Int, theTime: String, theProfile: String, theIncident: String, theDate: String)
    {
        name = theName
        address = theAddress
        number = theNumber
        time = theTime
        profile = theProfile
        incidentSummary = theIncident
        date = theDate
    }
    
    mutating func compileIncidentReport()
    {
       // completedIncidentReport = "The following is an unoffical incident report completed voluntarily: \n Name: \(name) \n Cell: \(number) \n Address: \(address) \n Date of incident: \(date) \n Time of Incident: \(time)\n Profile: \(profile)\n Incident Summary: \(incidentSummary) \n"
        
    }
    mutating func loadData()
    {
        if let data = UserDefaults.standard.data(forKey: "completeReport") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                //completedIncidentReport = try decoder.decode([completedIncidentReport].self, from: data)

            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
    }
    func saveData()
    {
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
           // let data = try encoder.encode(completedIncidentReport)

            // Write/Set Data
            //UserDefaults.standard.set(data, forKey: "completedIncidentReport")

        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    
}


