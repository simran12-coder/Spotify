//
//  ShowsViewController.swift
//  Spotify
//
//  Created by Desktop-simranjeet on 21/08/21.
//

import UIKit

class ShowsCell: UITableViewCell {
    
    var showImageArr = [#imageLiteral(resourceName: "tedTalksShow"),#imageLiteral(resourceName: "gitaShow"),#imageLiteral(resourceName: "michelleObamaShow"),#imageLiteral(resourceName: "theRanveerShow"),#imageLiteral(resourceName: "dhruvRatheeShow"),#imageLiteral(resourceName: "insideIosDevShow")]
    var showNameArr = ["TED Talks Daily","Gita for young and Restless","The Michelle Obama Podcast","The Ranveer Show","Maha Bharat with Dhruv Rathee","Inside iOS Dev"]
    var showLastUpdateArr = ["Updated today","Updated 15-Jul-2021","Updated today","Updated yesterday","Updated today","Updated 15-Aug-2021"]
    
    @IBOutlet weak var showImage:UIImageView!
    @IBOutlet weak var showName:UILabel!
    @IBOutlet weak var lastUpdate:UILabel!
}

class ShowsViewController: UIViewController {

    
    @IBOutlet weak var showsTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

}

extension ShowsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowsCell") as! ShowsCell
        cell.showImage.image = cell.showImageArr[indexPath.row]
        cell.showName.text = cell.showNameArr[indexPath.row]
        cell.lastUpdate.text = cell.showLastUpdateArr[indexPath.row]
        return cell
    }
}
