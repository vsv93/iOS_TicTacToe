//
//  ViewController.swift
//  TicTacToe
//
//  Created by Venkat on 18/01/17.
//  Copyright © 2017 vsv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    var activeGame = true
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],[0,4,8], [2,4,6]]

    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func playAgain(_ sender: Any) {
        
        activePlayer = 1
        activeGame = true
        gameState = [0,0,0,0,0,0,0,0,0]
        
        for i in 1..<10 {
            
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
            }
            
        }
        resultLabel.isHidden = true
        playAgainButton.isHidden = true
        
        resultLabel.center = CGPoint(x: resultLabel.center.x - 500, y: resultLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        
    }
    @IBAction func onClick(_ sender: UIButton) {
        
        let activePos = sender.tag - 1
        
        if (gameState[activePos] == 0) && activeGame {
            
            gameState[activePos] = activePlayer
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named: "nought.png"), for: [] )
                activePlayer = 2
                
            } else {
                
                sender.setImage(UIImage(named: "cross.png"), for: [] )
                activePlayer = 1
            }
            
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                   
                    activeGame = false
                    
                    resultLabel.isHidden = false
                    playAgainButton.isHidden = false
                    if (gameState[combination[0]] == 1){
                        resultLabel.text = "Noughts have Won!"
                    } else {
                        resultLabel.text = "Crosses have Won!"
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                    
                        self.resultLabel.center = CGPoint(x: self.resultLabel.center.x + 500, y: self.resultLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                    })
                    
                }
                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.isHidden = true
        playAgainButton.isHidden = true
        
        resultLabel.center = CGPoint(x: resultLabel.center.x - 500, y: resultLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

