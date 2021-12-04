//
//  EpisodesViewController.swift
//  Spotify
//
//  Created by Desktop-simranjeet on 21/08/21.
//

import UIKit

class EpisodesCell: UITableViewCell {
    
    @IBOutlet weak var podcastImage:UIImageView!
    @IBOutlet weak var postcastEpisodeName:UILabel!
    @IBOutlet weak var postcastName:UILabel!
    @IBOutlet weak var postcastEpisodeDescription:UILabel!
    @IBOutlet weak var lastDateAndTimeLeft:UILabel!
}

class EpisodesViewController: UIViewController {

    var podcastImageArr = [#imageLiteral(resourceName: "gitaShow"),#imageLiteral(resourceName: "tuesdayPeople")]
    var postcastEpisodeNameArr = [
        "Don't Let Scoial Media Define Your Self-Worth ",
        "Episode 7 - Forgive Others, Forgive Yourself"
    ]
    var postcastNameArr = [
        "Gita for the Young and Restless",
        "Stage 29 Podcast Productions"
    ]
    var postcastEpisodeDescriptionArr = [
        "Our body image is influenced ny ads, social and mass media. But can there be ONLY one standard for whar 'perfection' is? And what about the features (and flaws) we are born with? Don't obsess with the external says the Gita. Listen here to find out what truly matters.",
        "Forgive yourself first, the forgive others, was an aphorism that professor Morrie Schwartz held dear, especially in his final days of life, In this week's episode of the Tuesday podcast, Tuesdays With Morrie author, Mitch Album, and his co-host and producer Lisa Goich, discuss the topic of forgiveness"
    ]
    var lastDateAndTimeLeftArr = ["7 June - 1 min left" ,"15 September - 14 min left"]
    
    @IBOutlet weak var episodesTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        episodesTableView.separatorColor = UIColor.gray
    }

}

extension EpisodesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodesCell") as! EpisodesCell
        cell.podcastImage.image = podcastImageArr[indexPath.row]
        cell.postcastEpisodeName.text = postcastEpisodeNameArr[indexPath.row]
        cell.postcastName.text = postcastNameArr[indexPath.row]
        cell.postcastEpisodeDescription.text = postcastEpisodeDescriptionArr[indexPath.row]
        cell.lastDateAndTimeLeft.text = lastDateAndTimeLeftArr[indexPath.row]
        return cell
    }
    
}
