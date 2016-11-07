//
//  SearchViewController.swift
//  codepath_week4_assignment_tumblr
//
//  Created by StudyBlue on 11/4/16.
//  Copyright © 2016 myself. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchFeedImageView: UIImageView!
    @IBOutlet weak var loadFrame1: UIImageView!
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    
    var loadingImages: [UIImage]!
    var animatedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        
        loadingImages = [loading_1, loading_2, loading_3]
        
        animatedImage = UIImage.animatedImage(with: loadingImages, duration: 0.5)
        
        loadFrame1.image = animatedImage
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
        loadFrame1.isHidden = false
        loadFrame1.startAnimating()
        
        searchFeedImageView.isHidden = true
        
        
        delay(1.0, closure: {
            self.searchFeedImageView.isHidden = false
            self.loadFrame1.stopAnimating()
            self.loadFrame1.isHidden = true
        })
    }

}
