//
//  TodaysBiggestHitsCollectionViewCell.swift
//  Spotify
//
//  Created by Desktop-simranjeet on 19/08/21.
//

import UIKit

class TodaysBiggestHitsCollectionViewCell: UICollectionViewCell {
    
    var biggestHitsImagesArr = [#imageLiteral(resourceName: "download (5)"),#imageLiteral(resourceName: "download (7)"),#imageLiteral(resourceName: "download (2)"),#imageLiteral(resourceName: "download (4)"),#imageLiteral(resourceName: "download (1)")]
    var biggestHitsNameArr = ["Ed Sheeran, J Balvin, DaBaby, Gunna, SZA",
                              "Kanye West, Ed Sheeran, Doja Cat, Drake",
                              "BTS, Justin Bieber, The Weekand",
                              "Diljit Dosanjh, Sidhu Moose Wala, AP Dhillon",
                              "B Praak, Akull, Jubin Nautiyal, Neha Kakkar"
                             ]
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var musicNameLabel: UILabel!
    
    override func awakeFromNib() {
        
    }
    
}

