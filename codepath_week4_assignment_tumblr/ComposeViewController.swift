//
//  ComposeViewController.swift
//  codepath_week4_assignment_tumblr
//
//  Created by Devon on 11/4/16.
//  Copyright © 2016 myself. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    // Declare an array that will hold the buttons
    var buttons: [UIButton]!
    
    // Declare an array that will hold the buttons' original y positions
    var buttonLocationArray = [CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Initialize the array of the buttons to iterate over
        buttons = [textButton, photoButton, quoteButton, linkButton, chatButton, videoButton]
        
        // Initialize the array to record the original y location of all the compose buttons.
        buttonLocationArray = recordButtonOriginalY(array: buttons)
        
    }
    
    // record the original y position of all the compose buttons
    func recordButtonOriginalY(array: [UIButton]) -> [CGFloat] {
        
        for button in buttons {
            buttonLocationArray += [button.center.y]
        }
        return buttonLocationArray
    }
    
    // restore all buttons to their onscreen y positions
    func restoreOriginalY(buttonArray: [UIButton], locationArray: [CGFloat]) {
        
        var delay = 0.05
        
        for (index, button) in buttonArray.enumerated() {
            
            delay += 0.05
            
            UIView.animate(withDuration: 0.4, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.1, options: [.curveEaseOut], animations: {
                button.center.y = locationArray[index]
            })
        }
        
    }
    
    // make all the compose buttons fly up and offscreen when the user presses "nevermind"
    func animateComposeButtonsUpOffscreen(buttonArray: [UIButton], locationArray: [CGFloat]) {
        
        var delay = 0.05
        
        for (index, button) in buttonArray.enumerated() {
            
            delay += 0.05
            
            UIView.animate(withDuration: 0.2, delay: delay, options: [.curveEaseIn], animations: {
                button.center.y = locationArray[index] - 500
            })
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for button in buttons {
            
            button.center.y = 700
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        restoreOriginalY(buttonArray: buttons, locationArray: buttonLocationArray)
        
    }
    
    
    @IBAction func didTapNevermind(_ sender: Any) {
        
        animateComposeButtonsUpOffscreen(buttonArray: buttons, locationArray: buttonLocationArray)
        
        run(after: 0.2, closure: {
        
            self.dismiss(animated: true, completion: nil)
            
        })
        
    }


    
    

}
