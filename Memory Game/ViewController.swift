//
//  ViewController.swift
//  Memory Game
//
//  Created by Yasser Abouel-Saad on 15/4/17.
//  Copyright © 2017 Yasser Abouel-Saad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstButton : String!
    var secondButton: String!
    var buttonsCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClicked(TheButton : UIButton!){
        if buttonsCount == 0 {
            buttonsCount+=1
            firstButton = TheButton.titleLabel!.text
            print(TheButton.titleLabel!.text)
        }else if buttonsCount == 1 {
            secondButton = TheButton.titleLabel!.text
            print(TheButton.titleLabel!.text)
            if firstButton == secondButton {
                print("Good job")
            }else{
                print("Try again")
            }
            firstButton=nil
            secondButton=nil
            buttonsCount=0
        }
        
    }

}

