//
//  FirstViewController.swift
//  tabbedMiniApps
//
//  Created by Apple on 9/10/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!

    @IBOutlet weak var helloUserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tellSystemButton(_ sender: Any) {
        let newString = "Hello \(firstNameTextField.text!) \(lastNameTextField.text!), it is a pleasure to obtain your information..."
        
        helloUserLabel.text = newString
    }
    

}

