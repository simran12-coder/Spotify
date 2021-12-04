//
//  UserPlaylistsCollectionViewCell.swift
//  Spotify
//
//  Created by Desktop-simranjeet on 19/08/21.
//

import UIKit

class UserPlaylistsCollectionViewCell: UICollectionViewCell {
    
    var uniquelyYoursImagesArr = [#imageLiteral(resourceName: "onRepeat"),#imageLiteral(resourceName: "timeCapsule"),#imageLiteral(resourceName: "repeatRewind"),#imageLiteral(resourceName: "likedSongs"),#imageLiteral(resourceName: "top20Songs2020"),#imageLiteral(resourceName: "newArtist")]
    var uniquelyYoursNameArr = ["Songs you love right now",
                                "We made you a personalized playlist with songs to take you back in time.",
                                "Your past favorties",
                                "Liked Songs",
                                "The songs you loved most this year, all wrapped up.",
                                "Jazz"]
    @IBOutlet weak var uniquelyYoursImage: UIImageView!
    @IBOutlet weak var uniquelyYoursName: UILabel!
   
    override func awakeFromNib() {
       
    }
}
