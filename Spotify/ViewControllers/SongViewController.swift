//
//  SongViewController.swift
//  Spotify
//
//  Created by Desktop-simranjeet on 03/09/21.
//

import UIKit
import AVFoundation
import SRCountdownTimer

class SongViewController: UIViewController {
   
    var indexNumber:Int = 0
    var songName:String = ""
    var songAudio:String = ""
    var songImage:UIImage?
    var count = 0
    var timer = Timer()
    var progressValue : Float = 0.00
    var player: AVAudioPlayer?
    
    @IBOutlet weak var singerName:UILabel!
    @IBOutlet weak var artistImage:UIImageView!
    @IBOutlet weak var songNameLabel:UILabel!
    @IBOutlet weak var artistName:UILabel!
    @IBOutlet weak var playButton:UIButton!
    @IBOutlet weak var heartButton:UIButton!
    //@IBOutlet weak var timerView:SRCountdownTimer!
    @IBOutlet weak var timerLabel:UILabel!
    @IBOutlet weak var totalTimeLabel:UILabel!
    @IBOutlet weak var progressView:UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.font = UIFont(name: "Inter-Medium", size: 17)
        if let player = player, player.isPlaying {
            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            player.stop()
            timer.invalidate()
        }
        else {
            playSound()
        }
        
        artistImage.image = songImage
        songNameLabel.text = songName
        artistName.text = "Ritviz"
        singerName.text = "Ritviz"
        playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        player?.stop()
    }
    
    @objc func timerAction() {
        count += 1
        progressValue += 0.01
        timerLabel.text = getMinutesAndSeconds(remainingSeconds: count)
        progressView.progress = Float(progressValue) / 3.00
    }
    
    func getMinutesAndSeconds(remainingSeconds: Int) -> (String) {
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds - minutes * 60
        let secondString = seconds < 10 ? "0" + seconds.description : seconds.description
        return minutes.description + ":" + secondString
    }
    
    func getMinutesAndSecondsForProgress(remainingSeconds: Int) -> (String) {
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds - minutes * 60
        let secondString = seconds < 10 ? "0" + seconds.description : seconds.description
        return minutes.description + "." + secondString
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        player?.stop()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func heartButtonTapped(_ sender: UIButton) {
        if heartButton.imageView?.image == UIImage(systemName: "suit.heart.fill") {
            heartButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
            heartButton.tintColor = .white
            likedSongsArr.remove(at: sender.tag)
        }
        else {
        heartButton.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
        heartButton.tintColor = .white
        likedSongsArr.insert(LikedSongs.init(songImage: artistImage.image, songName: songNameLabel.text, singer: "Ritviz"), at: 0)
        }
    }
    
    @IBAction func backButtonTapped(_ sender:UIButton) {
        timer.invalidate()
        count = -1
        progressValue = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
        if indexNumber - 1 !=  0 {
        songNameLabel.text = songsArr[indexNumber - 1].songName
        artistImage?.image = songsArr[indexNumber - 1].songImage
        songAudio = songsArr[indexNumber - 1].songAudio!
        indexNumber = indexNumber - 1
        
        playSound()
        }
        else {
            player?.stop()
            timer.invalidate()
            dismiss(animated: true, completion: nil)
        }
        }
    }
    
    @IBAction func playButtonTapped(_ sender:UIButton) {
        if let player = player, player.isPlaying {
            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            player.stop()
            timer.invalidate()
        }
        else {
            playSound()
        }
    }
    
    @IBAction func nextButtonTapped(_ sender:UIButton) {
        timer.invalidate()
        count = -1
        progressValue = 0
        heartButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            if indexNumber + 1 != 5 {
            songNameLabel.text = songsArr[indexNumber + 1].songName
            artistImage?.image = songsArr[indexNumber + 1].songImage
            songAudio = songsArr[indexNumber + 1].songAudio!
            indexNumber = indexNumber + 1
            playSound()
            }
            else {
                player?.stop()
                timer.invalidate()
                dismiss(animated: true, completion: nil)
            }
        }
        
    }
}

extension SongViewController {
    
    func playSound() {
       
        guard let url = Bundle.main.url(forResource: songAudio, withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }
            
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            //   player.play()
            let shortStartDelay: TimeInterval = 0.01 // seconds
            let now: TimeInterval = player.deviceCurrentTime
            let timeDelayPlay: TimeInterval = now + shortStartDelay
            print(count)
            //player.currentTime = 50.0 // Specific time to start play
            
            player.play(atTime: timeDelayPlay)
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
            
            var duration = player.duration
            print(duration)
            duration -= 1
            totalTimeLabel.text = getMinutesAndSeconds(remainingSeconds: Int(duration))
        
            progressValue += 0.01
                progressView.progress = Float(progressValue) / Float(getMinutesAndSecondsForProgress(remainingSeconds: Int(duration)))!
            
//            print(getMinutesAndSeconds(remainingSeconds: Int(duration)))
//            if count == Int(getMinutesAndSeconds(remainingSeconds: Int(duration))) {
//                print("Yes")
//            }

        } catch let error {
            print(error.localizedDescription)
        }
        }
    
}
