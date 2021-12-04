//
//  UserTopShowsCollectionViewCell.swift
//  Spotify
//
//  Created by Desktop-simranjeet on 19/08/21.
//

import UIKit

class UserTopShowsCollectionViewCell: UICollectionViewCell {
    
    var topShowsImagesArr = [#imageLiteral(resourceName: "theRanveerShow"),#imageLiteral(resourceName: "gitaShow"),#imageLiteral(resourceName: "michelleObamaShow"),#imageLiteral(resourceName: "woice")]
    var topShowsNameArr = ["The Ranveer Show",
                           "Gita for the young and restless",
                           "The Michalle Obama podcast",
                           "Woice with Warikoo Podcast"
    ]
    var topShowsDescriptionArr = ["BeerBiceps aka Ranveer Allahbadia",
                                  "Spotify Studios",
                                  "Higher Ground",
                                  "Ankur Warikoo"
                                  ]
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var showNameLabel: UILabel!
    @IBOutlet weak var episodeTitleLabel: UILabel!
   
    override func awakeFromNib() {
       
    }
    
}
