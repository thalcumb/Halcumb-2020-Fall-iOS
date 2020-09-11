//
//  RNGMatchController.swift
//  tabbedMiniApps
//
//  Created by Apple on 9/10/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class RNGMatchController: UIViewController {
    
    @IBOutlet weak var leftNumberLabel: UILabel!
    @IBOutlet weak var rightNumberLabel: UILabel!
    
    var numLeft = 0
    var numRight = 0
    var attempts = 0
    
    @IBOutlet weak var attemptsLabel: UILabel!
    @IBOutlet weak var promptLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func rerollLeftButton(_ sender: Any) {
        let number = Int.random(in: 1..<9)
        numLeft = number
        if(numRight == numLeft){
            leftNumberLabel.text = String(number)
            promptLabel.text = "You win!"
            
            attempts = 0
            attemptsLabel.text = "Attempts: \(attempts)"
        }
        else {
            leftNumberLabel.text = String(number)
            
            attempts += 1
            attemptsLabel.text = "Attempts: \(attempts)"
            promptLabel.text = "Try to match the random numbers in as few attempts..."
        }
    }
    
    @IBAction func rerollRightButton(_ sender: Any) {
        let number = Int.random(in: 1..<9)
        numRight = number
        
        if(numRight == numLeft){
            rightNumberLabel.text = String(number)
            promptLabel.text = "You win!"
            
            attempts = 0
            attemptsLabel.text = "Attempts: \(attempts)"
        }
        else {
            rightNumberLabel.text = String(number)
            
            attempts += 1
            attemptsLabel.text = "Attempts: \(attempts)"
            promptLabel.text = "Try to match the random numbers in as few attempts..."
        }
        

        
        

    }
    


}
