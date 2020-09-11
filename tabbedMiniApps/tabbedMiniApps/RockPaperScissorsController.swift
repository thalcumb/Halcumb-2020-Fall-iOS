//
//  RockPaperScissors.swift
//  tabbedMiniApps
//
//  Created by Apple on 9/10/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

// 1 = Rock, 2 = Paper, 3 = Scissors

class RockPaperScissorsController: UIViewController {
    @IBOutlet weak var displayWinnerLabel: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func selectRockButton(_ sender: Any) {
        let number = Int.random(in: 1..<4)
        if(number == 1){
            let newString = "It's a draw...RNG picked Rock. Play again?"
            
            displayWinnerLabel.text = newString

        }
        else if(number == 2){
            let newString = "Yikes, you lose. RNG picked Paper..."
            
            displayWinnerLabel.text = newString
        }
        else if(number == 3){

            let newString = "YOU WIN! The RNG picked Scissors."
            
            displayWinnerLabel.text = newString
        }
    }
    
    @IBAction func selectPaperButton(_ sender: Any) {
        let number = Int.random(in: 1..<4)
        if(number == 1){
            let newString = "YOU WIN! The RNG picked Rock."
            
            displayWinnerLabel.text = newString
        }
        else if(number == 2){
            let newString = "It's a draw...RNG picked Paper. Play again?"
            
            displayWinnerLabel.text = newString
        }
        else if(number == 3){
            let newString = "Yikes, you lose. RNG picked Scissors..."
            
            displayWinnerLabel.text = newString
        }

    }
    
    @IBAction func selectScissorsButton(_ sender: Any) {
        let number = Int.random(in: 1..<4)
        if(number == 1){
            let newString = "Yikes, you lose. RNG picked Rock..."
            
            displayWinnerLabel.text = newString

        }
        else if(number == 2){
            let newString = "YOU WIN! The RNG picked Paper."
            
            displayWinnerLabel.text = newString
        }
        else if(number == 3){

            let newString = "It's a draw...RNG picked Scissors. Play again?"
            
            displayWinnerLabel.text = newString
        }
    }
}
