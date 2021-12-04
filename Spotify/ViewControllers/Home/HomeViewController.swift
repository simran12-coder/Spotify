//
//  HomeViewController.swift
//  Spotify
//
//  Created by Desktop-simranjeet on 18/08/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    var recentlyPlayedArr = [#imageLiteral(resourceName: "dhillion"),#imageLiteral(resourceName: "album"),#imageLiteral(resourceName: "diljit"),#imageLiteral(resourceName: "spanish"),#imageLiteral(resourceName: "ritviz"),#imageLiteral(resourceName: "newArtist")]
    var recentlyPlayedNameArr = ["AP Dhillion","Pop","Diljit Dosanjh","Shakira","Ritviz","Jazz"]
    
    let layoutForRecentlyPlayed = UICollectionViewFlowLayout()
    let layoutFortodaysHit = UICollectionViewFlowLayout()
    let layoutFortopShows = UICollectionViewFlowLayout()
    let layoutForPopularArtists = UICollectionViewFlowLayout()
    let layoutForUserPlaylists = UICollectionViewFlowLayout()
    
    @IBOutlet weak var greetingLabel:UILabel!
    @IBOutlet weak var recentlyPlayedCollectionView:UICollectionView!
    @IBOutlet weak var freshNewMusicCollectionView:UICollectionView!
    @IBOutlet weak var topShowsCollectionView:UICollectionView!
    @IBOutlet weak var popularArtistsCollectionView:UICollectionView!
    @IBOutlet weak var uniquelyYoursCollectionView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recentlyPlayedCollectionView.delegate = self
        recentlyPlayedCollectionView.dataSource = self
        freshNewMusicCollectionView.delegate = self
        freshNewMusicCollectionView.dataSource = self
        topShowsCollectionView.delegate = self
        topShowsCollectionView.dataSource = self
        popularArtistsCollectionView.delegate = self
        popularArtistsCollectionView.dataSource = self
        uniquelyYoursCollectionView.delegate = self
        uniquelyYoursCollectionView.dataSource = self
        recentlyPlayedCollectionView?.collectionViewLayout = layoutForRecentlyPlayed
        freshNewMusicCollectionView?.collectionViewLayout = layoutFortodaysHit
        topShowsCollectionView?.collectionViewLayout = layoutFortopShows
        popularArtistsCollectionView?.collectionViewLayout = layoutForPopularArtists
        uniquelyYoursCollectionView?.collectionViewLayout = layoutForUserPlaylists
        layoutForRecentlyPlayed.scrollDirection =  .horizontal
        layoutFortodaysHit.scrollDirection = .horizontal
        layoutFortopShows.scrollDirection = .horizontal
        layoutForPopularArtists.scrollDirection = .horizontal
        layoutForUserPlaylists.scrollDirection = .horizontal
        
    }
    
    @IBAction func userListFirstTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Songs", bundle: nil)
        let userListVC = storyboard.instantiateViewController(identifier: "ArtistsSongsViewController") as! ArtistsSongsViewController
        navigationController?.pushViewController(userListVC, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == freshNewMusicCollectionView  {
            return 5
        }
        else if collectionView == topShowsCollectionView {
            return 4
        }
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == recentlyPlayedCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentlyPlayedCollectionViewCell", for: indexPath) as! RecentlyPlayedCollectionViewCell
            cell.albumImage.image = recentlyPlayedArr[indexPath.row]
            cell.musicNameLabel.text = recentlyPlayedNameArr[indexPath.row]
            return cell
        }
        else if collectionView == freshNewMusicCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodaysBiggestHitsCollectionViewCell", for: indexPath) as! TodaysBiggestHitsCollectionViewCell
            cell.albumImage.image = cell.biggestHitsImagesArr[indexPath.row]
            cell.musicNameLabel.text = cell.biggestHitsNameArr[indexPath.row]
            return cell
        }
        else if collectionView == topShowsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserTopShowsCollectionViewCell", for: indexPath) as! UserTopShowsCollectionViewCell
            cell.showImage.image = cell.topShowsImagesArr[indexPath.row]
            cell.showNameLabel.text = "Show " + cell.topShowsDescriptionArr[indexPath.row]
            cell.episodeTitleLabel.text = cell.topShowsNameArr[indexPath.row]
            return cell
        }
        else if collectionView == popularArtistsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularArtistsCollectionViewCell", for: indexPath) as! PopularArtistsCollectionViewCell
            cell.artistImage.image = cell.artistsArr[indexPath.row]
            cell.artistName.text = cell.artistsNameArr[indexPath.row]
            return cell
        }
        else if collectionView == uniquelyYoursCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserPlaylistsCollectionViewCell", for: indexPath) as! UserPlaylistsCollectionViewCell
            cell.uniquelyYoursImage.image = cell.uniquelyYoursImagesArr[indexPath.row]
            cell.uniquelyYoursName.text = cell.uniquelyYoursNameArr[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topShowsCollectionView || collectionView == uniquelyYoursCollectionView {
            let size = (collectionView.frame.size.width) / 3
            return CGSize(width: size, height: 153)
        }
        else {
        let size = (collectionView.frame.size.width) / 3
        return CGSize(width: size, height: 150)
        }
    }
    
}

extension HomeViewController {
    
    // MARK:- Logic for Greetings
    func greetingLogic() {
           let date = NSDate()
           let calendar = NSCalendar.current
           let currentHour = calendar.component(.hour, from: date as Date)
           let hourInt = Int(currentHour.description)!

           if hourInt >= 12 && hourInt <= 16 {
            greetingLabel.text = "Good" + " " + "Afternoon, "
           }
           else if hourInt >= 7 && hourInt <= 12 {
            greetingLabel.text = "Good" + " " + "Morning, "
           }
           else if hourInt >= 16 && hourInt <= 20 {
            greetingLabel.text = "Good" + " " + "Evening, "
           }
           else if hourInt >= 20 && hourInt <= 24 {
            greetingLabel.text = "Good" + " " + "Night, "
           }
       }
}


