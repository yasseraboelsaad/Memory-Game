//
//  ViewController.swift
//  Memory Game
//
//  Created by Yasser Abouel-Saad on 15/4/17.
//  Copyright © 2017 Yasser Abouel-Saad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstButtonText : String!
    var secondButtonText: String!
    var firstButtonTag : Int!
    var secondButtonTag: Int!
    var buttonsCount: Int = 0
    var Button : UIButton!
    
    let array = ["aceOfHearts","JackOfSpades","QueenOfHearts","kingOfHearts"
                ,"aceOfSpades","QueenOfSpades","JackOfHearts","kingOfSpades"
                ,"JackOfHearts","aceOfSpades","QueenOfHearts","QueenOfSpades"
                ,"kingOfHearts","kingOfSpades","aceOfHearts","JackOfSpades"]
    @IBOutlet var buttonsArray: [UIButton]!
    var gameCounter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        if buttonsCount==0 {
            UIView.transition(with: sender, duration: 0.5, options: .transitionFlipFromRight, animations: {
                sender.setImage(UIImage(named: self.array[sender.tag]), for: .normal)
            }, completion: nil)
            firstButtonTag=sender.tag
            Button=sender
            firstButtonText=array[sender.tag]
            buttonsCount+=1
        }else if buttonsCount == 1{
            UIView.transition(with: sender, duration: 0.5, options: .transitionFlipFromRight, animations: {
                sender.setImage(UIImage(named: self.array[sender.tag]), for: .normal)
            }, completion: nil)
            secondButtonTag=sender.tag
            secondButtonText=array[sender.tag]
            let when = DispatchTime.now() + 1 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                // Your code with delay
                if (self.firstButtonText == self.secondButtonText) && !(self.Button==sender) {
                    self.buttonsArray[self.firstButtonTag].isEnabled=false
                    self.buttonsArray[self.secondButtonTag].isEnabled=false
                    self.gameCounter+=1
                    if self.gameCounter==8{
                        self.gameOver()
                    }
                }else{
                    UIView.transition(with: self.buttonsArray[self.firstButtonTag], duration: 0.5, options: .transitionFlipFromLeft, animations: {
                        self.buttonsArray[self.firstButtonTag].setImage(#imageLiteral(resourceName: "back"), for: .normal)
                    }, completion: nil)
                    UIView.transition(with: self.buttonsArray[self.secondButtonTag], duration: 0.5, options: .transitionFlipFromLeft, animations: {
                        self.buttonsArray[self.secondButtonTag].setImage(#imageLiteral(resourceName: "back"), for: .normal)
                    }, completion: nil)
                }
            }
            
            buttonsCount=0
        }
        
    }
    @IBAction func restartGameButton() {
        restartGame()
    }
    
    @IBAction func info() {
        let alert = UIAlertController(title: nil,message: "Click on the cards to flip them, try to flip two identical cards in a row to match them, may the odds be ever in your favour!", preferredStyle: .alert)
        let action = UIAlertAction(title:"OK", style: .default,  handler: nil)
        alert.addAction(action)
        present(alert, animated: true,completion: nil)
    }
    
    func gameOver(){
        let alert = UIAlertController(title: nil,message: "Well Done!", preferredStyle: .alert)
        let action = UIAlertAction(title:"Play again!", style: .default,  handler: { action in
            self.restartGame()
        })
        alert.addAction(action)
        present(alert, animated: true,completion: nil)
    }
    
    func restartGame(){
        gameCounter=0
        for button in buttonsArray{
            UIView.transition(with: button, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
            }, completion: nil)
            button.isEnabled=true
        }
    }
    

}

