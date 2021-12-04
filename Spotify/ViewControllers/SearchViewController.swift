//
//  SearchViewController.swift
//  Spotify
//
//  Created by Desktop-simranjeet on 18/08/21.
//

import UIKit

class GenresCell:UICollectionViewCell {
    
    @IBOutlet weak var genreName:UILabel!
    @IBOutlet weak var genreImage:UIImageView!
    @IBOutlet weak var genreView:UIView!
   
    override func awakeFromNib() {
        genreImage.transform = genreImage.transform.rotated(by: .pi / 6)
    }
}

class SearchViewController: UIViewController {
    
    
    var genresArr = ["","","","","","","","","","","",""]
    var genreNameArr = ["At Home","New Releases","Classic","Hollywood","Folk","Soft Music","Poscasts","Concerts","Punjabi","Focus","Summer","Soul"]
    var genreImageArr = [#imageLiteral(resourceName: "diljit"),#imageLiteral(resourceName: "ariana"),#imageLiteral(resourceName: "grande"),#imageLiteral(resourceName: "rihanna"),#imageLiteral(resourceName: "download (4)"),#imageLiteral(resourceName: "harryStyles"),#imageLiteral(resourceName: "michelleObamaShow"),#imageLiteral(resourceName: "ritviz"),#imageLiteral(resourceName: "diljit"),#imageLiteral(resourceName: "tedTalksShow"),#imageLiteral(resourceName: "BTS"),#imageLiteral(resourceName: "liggi")]
    var genreViewColorArr = [UIColor.systemGreen,UIColor.brown,UIColor.lightText,UIColor.blue,UIColor.brown,UIColor.brown,.systemTeal,UIColor.red,UIColor.brown,UIColor.systemPurple,UIColor.systemYellow,UIColor.orange]
    
    @IBOutlet weak var popImage:UIImageView!
    @IBOutlet weak var folkAndAcousticImage:UIImageView!
    @IBOutlet weak var bollywoodImage:UIImageView!
    @IBOutlet weak var hipHopImage:UIImageView!
    @IBOutlet weak var genresCollectionView:UICollectionView!
    @IBOutlet weak var genresCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var searchField: UITextField!
    let layout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchField.placeHolderColor = UIColor.black
        genresCollectionView.delegate = self
        genresCollectionView.dataSource = self
        genresCollectionView?.collectionViewLayout = layout
       // layout.scrollDirection =  .horizontal
        popImage.transform = popImage.transform.rotated(by: .pi / 6)
        folkAndAcousticImage.transform = folkAndAcousticImage.transform.rotated(by: .pi / 6)
        bollywoodImage.transform = bollywoodImage.transform.rotated(by: .pi / 6)
        hipHopImage.transform = hipHopImage.transform.rotated(by: .pi / 6)
    }

}

extension SearchViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genresArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenresCell", for: indexPath) as! GenresCell
       // self.genresCollectionViewHeight.constant = CGFloat(genresArr.count / 2 * 80)
        cell.genreName.text = genreNameArr[indexPath.row]
        cell.genreImage.image = genreImageArr[indexPath.row]
        cell.genreView.backgroundColor = genreViewColorArr[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 10) / 2
        return CGSize(width: size, height: 80)
    }
    
}

