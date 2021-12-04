//
//  YourLibraryViewController.swift
//  Spotify
//
//  Created by Desktop-simranjeet on 18/08/21.
//

import UIKit

class YourLibraryViewController: UIViewController {

    @IBOutlet weak var musicButton:UIButton!
    @IBOutlet weak var podcastsButton:UIButton!
    @IBOutlet weak var musicView:UIView!
    @IBOutlet weak var podcastsView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicView.isHidden = false
        podcastsView.isHidden = true
      
    }
    
    @IBAction func musicButtonTapped() {
        
        podcastsButton.setTitleColor(UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0), for: .normal)
        musicButton.setTitleColor(UIColor.white, for: .normal)
        
        musicView.isHidden = false
        podcastsView.isHidden = true
    }
    
    @IBAction func podcastsButtonTapped() {
        
        musicButton.setTitleColor(UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0), for: .normal)
        podcastsButton.setTitleColor(UIColor.white, for: .normal)
        
        musicView.isHidden = true
        podcastsView.isHidden = false
    }
    
    @objc private func musicLabelTapped(_ sender:UIGestureRecognizer) {
        musicView.isHidden = false
        podcastsView.isHidden = true
    }
    
    @objc private func podcastsLabelTapped(_ sender:UIGestureRecognizer) {
        musicView.isHidden = true
        podcastsView.isHidden = false
    }

}
