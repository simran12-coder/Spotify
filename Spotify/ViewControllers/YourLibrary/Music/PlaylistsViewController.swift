//
//  PlaylistsViewController.swift
//  Spotify
//
//  Created by Desktop-simranjeet on 21/08/21.
//

import UIKit

class PlaylistsViewHeader: UITableViewCell {
    
    @IBOutlet weak var searchTextField:UITextField!
}

class PlaylistsCell: UITableViewCell {
    
    var playlistsImagesArr = [#imageLiteral(resourceName: "likedSongs"),#imageLiteral(resourceName: "bhagwadhGeeta"),#imageLiteral(resourceName: "yourEpisodes"),#imageLiteral(resourceName: "singAlongPunjabi"),#imageLiteral(resourceName: "spanish")]
    var playlistTitleArr = ["Liked Songs","Bhagwadh Geeta","Your Episodes","Sing-along: Punjabi","Spanish"]
    var playlistOwnerArr = ["\(likedSongsArr.count)" + " songs","By Simran","7 Episodes","By Spotify","By Simran"]
    
    @IBOutlet weak var playlistImage:UIImageView!
    @IBOutlet weak var playlistTitle:UILabel!
    @IBOutlet weak var playlistOwner:UILabel!
    
    override func awakeFromNib() {
        
    }
}

class PlaylistsViewController: UIViewController {

    
    @IBOutlet weak var playlistTableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        playlistTableView.separatorStyle = .none
       
    }
}

extension PlaylistsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistsCell") as! PlaylistsCell
        cell.playlistImage.image = cell.playlistsImagesArr[indexPath.row]
        cell.playlistTitle.text = cell.playlistTitleArr[indexPath.row]
        cell.playlistOwner.text = cell.playlistOwnerArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let storyboard = UIStoryboard(name: "Songs", bundle: nil)
            let likedSongsVc = storyboard.instantiateViewController(identifier: "LikedSongsViewController") as! LikedSongsViewController
            navigationController?.pushViewController(likedSongsVc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "PlaylistsViewHeader") as! PlaylistsViewHeader
        header.searchTextField.placeHolderColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 1.0)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
    
    
}
