//
//  MusicViewController.swift
//  Spotify
//
//  Created by Desktop-simranjeet on 21/08/21.
//

import UIKit

class MusicViewController: UIViewController {

    @IBOutlet weak var playlistsButton:UIButton!
    @IBOutlet weak var artistsButton:UIButton!
    @IBOutlet weak var albumsButton:UIButton!
    
    @IBOutlet weak var playlistsView:UIView!
    @IBOutlet weak var artistsView:UIView!
    @IBOutlet weak var albumsView:UIView!
    
    @IBOutlet weak var playlistsBottomView:UIView!
    @IBOutlet weak var artistsBottomView:UIView!
    @IBOutlet weak var albumsBottomView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playlistsView.isHidden = false
        artistsView.isHidden = true
        albumsView.isHidden = true
        
        playlistsButton.setTitleColor(UIColor.white, for: .normal)
        artistsButton.setTitleColor(UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0), for: .normal)
        albumsButton.setTitleColor(UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0), for: .normal)
        
        playlistsBottomView.isHidden = false
        artistsBottomView.isHidden = true
        albumsBottomView.isHidden = true
    }
    
    @IBAction func playlistsButtonTapped() {
        playlistsView.isHidden = false
        artistsView.isHidden = true
        albumsView.isHidden = true
        
        playlistsButton.setTitleColor(UIColor.white, for: .normal)
        artistsButton.setTitleColor(UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0), for: .normal)
        albumsButton.setTitleColor(UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0), for: .normal)
        
        playlistsBottomView.isHidden = false
        artistsBottomView.isHidden = true
        albumsBottomView.isHidden = true
    }
    
    @IBAction func artistsButtonTapped() {
        playlistsView.isHidden = true
        artistsView.isHidden = false
        albumsView.isHidden = true
        
        playlistsButton.setTitleColor(UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0), for: .normal)
        artistsButton.setTitleColor(UIColor.white, for: .normal)
        albumsButton.setTitleColor(UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0), for: .normal)
        
        playlistsBottomView.isHidden = true
        artistsBottomView.isHidden = false
        albumsBottomView.isHidden = true
    }
    
    @IBAction func albumsButtonTapped() {
        playlistsView.isHidden = true
        artistsView.isHidden = true
        albumsView.isHidden = false
        
        playlistsButton.setTitleColor(UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0), for: .normal)
        artistsButton.setTitleColor(UIColor(red: 188/255, green: 188/255, blue: 188/255, alpha: 1.0), for: .normal)
        albumsButton.setTitleColor(UIColor.white, for: .normal)
        
        
        playlistsBottomView.isHidden = true
        artistsBottomView.isHidden = true
        albumsBottomView.isHidden = false
    }
    


}
