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
    let array = ["😂","😒","😲","😱","😍","😭","😛","😔","😛","😍","😲","😭","😱","😔","😂","😒"]
    @IBOutlet var buttonsArray: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for button in buttonsArray{
            button.setTitle("⁇", for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        if buttonsCount==0 {
            sender.setTitle(array[sender.tag], for: .normal)
            firstButtonTag=sender.tag
            Button=sender
            firstButtonText=array[sender.tag]
            buttonsCount+=1
        }else if buttonsCount == 1{
            sender.setTitle(array[sender.tag], for: .normal)
            secondButtonTag=sender.tag
            secondButtonText=array[sender.tag]
            let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                // Your code with delay
                if (self.firstButtonText == self.secondButtonText) && !(self.Button==sender) {
                }else{
                    self.buttonsArray[self.firstButtonTag].setTitle("⁇", for: .normal)
                    self.buttonsArray[self.secondButtonTag].setTitle("⁇", for: .normal)
                }
            }
            
            buttonsCount=0
        }
        
    }
    

}

