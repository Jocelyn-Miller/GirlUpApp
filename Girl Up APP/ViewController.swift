//
//  ViewController.swift
//  Girl Up APP
//
//  Created by Jocelyn Miller on 11/9/20.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

          view.addGestureRecognizer(tap)
      }
        // Do any additional setup after loading the view.
    }




