//
//  TrendingViewController.swift
//  codepath_week4_assignment_tumblr
//
//  Created by StudyBlue on 11/4/16.
//  Copyright © 2016 myself. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {
    
    
    @IBOutlet weak var trendingScrollView: UIScrollView!
    @IBOutlet weak var trendingFeedImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        trendingScrollView.contentSize = trendingFeedImageView.frame.size
        
    }



}
