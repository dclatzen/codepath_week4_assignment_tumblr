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
    
    var buttons: [UIButton]!
    
    var buttonLocationArray = [CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        buttons = [textButton, photoButton, quoteButton, linkButton, chatButton, videoButton]
        
        buttonLocationArray = recordButtonOriginalY(array: buttons)
        
        print (buttonLocationArray)
        
    }
    
    func recordButtonOriginalY(array: [UIButton]) -> [CGFloat] {
        
        for button in buttons {
            buttonLocationArray += [button.center.y]
        }
        return buttonLocationArray
    }
    
    func restoreOriginalY(buttonArray: [UIButton], locationArray: [CGFloat]) {
        
        for (index, button) in buttonArray.enumerated() {
            
            var delayAmount: Double! = 0.2
            
            UIView.animate(withDuration: 0.3, delay: delayAmount, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [.curveEaseOut], animations: {
                button.center.y = locationArray[index]
            })
            
            delayAmount = delayAmount + 0.1
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for button in buttons {
            
            let goOffScreen = CGFloat(arc4random_uniform(2000) + 700)
            
            button.center.y = goOffScreen
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        restoreOriginalY(buttonArray: buttons, locationArray: buttonLocationArray)
    }
    
    
    @IBAction func didTapNevermind(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }


    
    

}