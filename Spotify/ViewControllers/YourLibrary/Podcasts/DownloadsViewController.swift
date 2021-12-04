//
//  DownloadsViewController.swift
//  Spotify
//
//  Created by Desktop-simranjeet on 21/08/21.
//

import UIKit

class DownloadsCell: UITableViewCell {
    
}

class DownloadsViewController: UIViewController {

    @IBOutlet weak var downloadsTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadsTableView.separatorColor = .none
    }
}

extension DownloadsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DownloadsCell") as! DownloadsCell
        return cell
    } 
    
}
