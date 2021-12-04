//
//  PodcastsViewController.swift
//  Spotify
//
//  Created by Desktop-simranjeet on 21/08/21.
//

import UIKit

class PodcastsViewController: UIViewController {

    @IBOutlet weak var episodesButton:UIButton!
    @IBOutlet weak var downloadButton:UIButton!
    @IBOutlet weak var showsButton:UIButton!
    
    @IBOutlet weak var episodesView:UIView!
    @IBOutlet weak var downloadView:UIView!
    @IBOutlet weak var showsView:UIView!
    
    @IBOutlet weak var episodesBottomView:UIView!
    @IBOutlet weak var downloadBottomView:UIView!
    @IBOutlet weak var showsBottomView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        episodesView.isHidden = false
        downloadView.isHidden = true
        showsView.isHidden = true
        
        episodesButton.setTitleColor(UIColor.white, for: .normal)
        downloadButton.setTitleColor(UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0), for: .normal)
        showsButton.setTitleColor(UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0), for: .normal)
        
        episodesBottomView.isHidden = false
        downloadBottomView.isHidden = true
        showsBottomView.isHidden = true
    }
    
    //MARK:- Action event for episodes button
    @IBAction func episodesButtonTapped() {
        episodesView.isHidden = false
        downloadView.isHidden = true
        showsView.isHidden = true
        
        episodesButton.setTitleColor(UIColor.white, for: .normal)
        downloadButton.setTitleColor(UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0), for: .normal)
        showsButton.setTitleColor(UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0), for: .normal)
        
        episodesBottomView.isHidden = false
        downloadBottomView.isHidden = true
        showsBottomView.isHidden = true
    }
    
    //MARK:- Action event for download button
    @IBAction func downloadButtonTapped() {
        episodesView.isHidden = true
        downloadView.isHidden = false
        showsView.isHidden = true
        
        episodesButton.setTitleColor(UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0), for: .normal)
        downloadButton.setTitleColor(UIColor.white, for: .normal)
        showsButton.setTitleColor(UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0), for: .normal)
        
        episodesBottomView.isHidden = true
        downloadBottomView.isHidden = false
        showsBottomView.isHidden = true
    }
    
    //MARK:- Action event for shows button
    @IBAction func showsButtonTapped() {
        episodesView.isHidden = true
        downloadView.isHidden = true
        showsView.isHidden = false
        
        episodesButton.setTitleColor(UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0), for: .normal)
        downloadButton.setTitleColor(UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0), for: .normal)
        showsButton.setTitleColor(UIColor.white, for: .normal)
        
        episodesBottomView.isHidden = true
        downloadBottomView.isHidden = true
        showsBottomView.isHidden = false
    }

}
