//
//  VideoViewController.swift
//  DailyTennisProject
//
//  Created by John Doll on 10/13/22.
//

import UIKit
import AVKit
import SwiftUI

class VideoViewController: UIViewController {
    
    var selectedVideo: String?
    var videoPlayer: AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let url = URL(string: "https://dailytennis.s3.us-east-2.amazonaws.com/\(selectedVideo ?? "")") {
            videoPlayer = AVPlayer(url: url)
            let playerLayer = AVPlayerLayer(player: videoPlayer)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = videoPlayer
            playerLayer.frame = self.view.bounds
            playerViewController.showsPlaybackControls = true
            try! AVAudioSession.sharedInstance().setCategory(.playback)
            
            // creates view inside detailviewcontroller and then plays video
            self.view.layer.addSublayer(playerLayer)
            videoPlayer.play()
            
            // cannot be used when the above two lines are not commented out, allows for playback controls but blocks the nav controller
            //           self.present(playerViewController, animated: true) {
            //               playerViewController.player!.play()
            //
            //           }
        }
        
        // calls videoDidEnd method to return to main nav controller
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    @objc func videoDidEnd(notification: NSNotification) {
        // make it so that when the video ends, it takes just a second to go back to main screen
        usleep(750_000)
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
        tabBarController?.tabBar.isHidden = false
    }
}
