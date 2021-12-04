//
//  PopularArtistsCollectionViewCell.swift
//  Spotify
//
//  Created by Desktop-simranjeet on 19/08/21.
//

import UIKit

class PopularArtistsCollectionViewCell: UICollectionViewCell {
    
    var artistsArr = [#imageLiteral(resourceName: "grande"),#imageLiteral(resourceName: "diljitDosanjh"),#imageLiteral(resourceName: "harryStyles"),#imageLiteral(resourceName: "cardiB"),#imageLiteral(resourceName: "arijitSingh"),#imageLiteral(resourceName: "BTS")]
    var artistsNameArr = ["Ariana Grande","Diljit Dosanjh","Harry Styles","Cardi B","Arijit Singh","BTS"]
    
    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var artistName: UILabel!
   
    override func awakeFromNib() {
       
    }
}
