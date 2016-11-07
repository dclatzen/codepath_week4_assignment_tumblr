//
//  TabBarViewController.swift
//  codepath_week4_assignment_tumblr
//
//  Created by Devon on 11/4/16.
//  Copyright © 2016 myself. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!

    @IBOutlet var buttons:[UIButton]!
    @IBOutlet var viewControllers: [UIViewController]!
    @IBOutlet weak var exploreButton: UIImageView!
    
    var currentTabSelected: Int = 0
    var selectedIndex: Int = 0
    var exploreButtonOriginalY: CGFloat!
    
    // instance variables for view controllers
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewControllerId")
        
        searchViewController = storyboard.instantiateViewController(withIdentifier: "SearchViewControllerId")
        
        composeViewController = storyboard.instantiateViewController(withIdentifier: "ComposeViewControllerId")
        
        accountViewController = storyboard.instantiateViewController(withIdentifier: "AccountViewControllerId")
        
        trendingViewController = storyboard.instantiateViewController(withIdentifier: "TrendingViewControllerId")
        
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
        
        bobTheExploreButton()
        
    }

    @IBAction func didPressTab(_ sender: UIButton) {
        
        // Since one button is always in a selected state, selectedIndex always exists (remember we are not tracking the button, rather we are tracking the button's tag number). When the user presses any button, we assign the button's tag that was already in a selected state (not the one they pressed) to "previousIndex".
        let previousIndex = selectedIndex
        
        
        // After that, we update the selectedIndex number with the new button's tag number (that button is still not selected though). So now we have two variables - previousIndex and selectedIndex - each with a different number.
        selectedIndex = sender.tag
        
        // Turn off the selected state for the previously-selected button. Since we have an array that contains the buttons, we can reference buttons with tag numbers, corresponding to their index value. This references the currently-selected button (not the newly-pressed one).
        buttons[previousIndex].isSelected = false
        
        print ("previousIndex: \(previousIndex)")
        print ("buttons[previousIndex]: \(buttons[previousIndex])")
        print ("previousIndex.isSelected = \(buttons[previousIndex].isSelected)")
        print ("selectedIndex: \(selectedIndex)")
        
        
        // Remove the previous viewController. Again, since we have an array full of view controllers, we can access them using tag numbers that correspond to their index values.
        let previousVC = viewControllers[previousIndex]
        
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        // Now we change the newly-pressed button to a selected state
        sender.isSelected = true
        
        // reference a view controller based on the newly-selected button's tag value
        let vc = viewControllers[selectedIndex]
        
        // add the new view controller (calls the `viewWillAppear` method of the view controller you are adding. **I don't understand this yet.**
        addChildViewController(vc)
        
        // adjust the size of the view controller view you are adding to match the `contentView` of your tabBarViewController, and add it as a subView of the `contentView`. 
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        
        // call the viewDidAppear method of the view controller you are adding using the didMove(toParentController: self) **I don't understand this yet.**
        vc.didMove(toParentViewController: self)
        
        if sender.tag == 1 {
            exploreButton.stopAnimating()
            exploreButton.isHidden = true
        }
        
    }
    
    
    func bobTheExploreButton() {
        
        exploreButtonOriginalY = exploreButton.center.y
        exploreButton.center.y += 5
        
        UIView.animate(withDuration: 0.7, delay: 0, options: [.autoreverse, .curveEaseInOut, .repeat], animations:{
            self.exploreButton.center.y = self.exploreButtonOriginalY
        })
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
