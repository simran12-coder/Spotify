//
//  ArtistsViewController.swift
//  Spotify
//
//  Created by Desktop-simranjeet on 21/08/21.
//

import UIKit

class ArtistViewHeader: UITableViewCell {
    
    @IBOutlet weak var searchTextField:UITextField!
}

class ArtistCell: UITableViewCell {
    
    var artistNameArr = ["Ariana Grande","Diljit Dosanjh","Harry Styles","BTS","AP Dhillion","Ritviz","Poscasts","Concerts","Punjabi","Tamil","Telugu","Marathi"]
    
    var artistImageArr = [#imageLiteral(resourceName: "ariana"),#imageLiteral(resourceName: "diljitDosanjh"),#imageLiteral(resourceName: "harryStyles"),#imageLiteral(resourceName: "BTS"),#imageLiteral(resourceName: "dhillion"),#imageLiteral(resourceName: "ritviz")]
    
    @IBOutlet weak var artistName:UILabel!
    @IBOutlet weak var artistImage:UIImageView!
    
    override func awakeFromNib() {
        
    }
}

class ArtistsViewController: UIViewController {

    
    @IBOutlet weak var artistTableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

  
}

extension ArtistsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistCell") as! ArtistCell
        cell.artistImage.image = cell.artistImageArr[indexPath.row]
        cell.artistName.text = cell.artistNameArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "ArtistViewHeader") as! ArtistViewHeader
        header.searchTextField.placeHolderColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 1.0)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
}
