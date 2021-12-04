//
//  LikedSongsViewController.swift
//  Spotify
//
//  Created by Desktop-simranjeet on 03/09/21.
//

import UIKit

struct LikedSongs {
    var songImage:UIImage?
    var songName: String?
    var singer:String?
}

var likedSongsArr = [LikedSongs]()

class LikedSongsCell: UITableViewCell {
    
    @IBOutlet weak var songImage:UIImageView!
    @IBOutlet weak var songName:UILabel!
    @IBOutlet weak var singer:UILabel!
    @IBOutlet weak var heartButton:UIButton!
}

class LikedSongsViewController: UIViewController {

    
    @IBOutlet weak var likedSongsCount:UILabel!
    @IBOutlet weak var likedSongsTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        likedSongsTableView.separatorStyle = .none
        
        likedSongsCount.text = "\(likedSongsArr.count)" + " songs"
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }

}

extension LikedSongsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likedSongsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikedSongsCell") as! LikedSongsCell
        
        cell.songImage.image = likedSongsArr[indexPath.row].songImage
        cell.songName.text = likedSongsArr[indexPath.row].songName
        cell.singer.text = likedSongsArr[indexPath.row].singer
        cell.heartButton.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    @objc private func heartButtonTapped(_ sender: UIButton) {
        likedSongsArr.remove(at: sender.tag)
        likedSongsTableView.reloadData()
        likedSongsCount.text = "\(likedSongsArr.count)" + " songs"
    }
    
}
