//
//  ArtistsSongsViewController.swift
//  Spotify
//
//  Created by Desktop-simranjeet on 02/09/21.
//

import UIKit

struct Songs {
    var songImage:UIImage?
    var songName:String?
    var songAudio:String?
}

var songsArr = [Songs]()

class ArtistsSongsCell: UITableViewCell {
    
    
    var listencersArr  = ["21,22,3334","24,22,334","51,56,3334","6,10,3344","45,22,554"]
    
    @IBOutlet weak var countLabel:UILabel!
    @IBOutlet weak var songsImage:UIImageView!
    @IBOutlet weak var songNameLabel:UILabel!
    @IBOutlet weak var listencersLabel:UILabel!
}

class ArtistsSongsViewController: UIViewController {

    var songsImagesArr = [#imageLiteral(resourceName: "thandi_hawa"),#imageLiteral(resourceName: "liggi"),#imageLiteral(resourceName: "liggi"),#imageLiteral(resourceName: "thandi_hawa"),#imageLiteral(resourceName: "liggi")]
    var songNameArr = ["Liggi","Udd Gaye","Sage","Chalo Chalein","Thandi Hawa"]
    var songsAudioArr = ["Liggi - Ritviz","Udd Gaye Ved 320 Kbps","Sage_192(PaglaSongs)","Chalo Chalein - Ritviz","Thandi Hawa Ritviz 128 Kbps"]
    
    
    @IBOutlet weak var artistName:UILabel!
    @IBOutlet weak var playButton:UIButton!
    @IBOutlet weak var songsTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artistName.text = "Ritviz"
        songsTableView.separatorStyle = .none
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}

extension ArtistsSongsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistsSongsCell") as! ArtistsSongsCell
        cell.countLabel.text = "\(indexPath.row + 1)" + "."
        cell.songNameLabel.text = songNameArr[indexPath.row]
        cell.listencersLabel.text = cell.listencersArr[indexPath.row]
        cell.songsImage.image = songsImagesArr[indexPath.row]
        
        songsArr.insert(Songs(songImage: songsImagesArr[indexPath.row], songName: songNameArr[indexPath.row], songAudio: songsAudioArr[indexPath.row]), at: 0)
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        
        let songVc = storyboard?.instantiateViewController(identifier: "SongViewController") as! SongViewController
        songVc.indexNumber = indexPath.row
        songVc.songAudio = songsAudioArr[indexPath.row]
        songVc.songImage = songsImagesArr[indexPath.row]
        songVc.songName = songNameArr[indexPath.row]
        
        present(songVc, animated: true, completion: nil)
    }
    
}
