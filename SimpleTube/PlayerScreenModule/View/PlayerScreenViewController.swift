//
//  PlayerScreenViewController.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 28.07.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import UIKit


class PlayerScreenViewController: UIViewController/*, YTSwiftyPlayerDelegate*/ {
    
    
    @IBOutlet weak var playerView: UIView!
//    @IBOutlet weak var playerView: YouTubePlayerView!
    var presenter: PlayerScreenPresenterProtocol!
//    private var player: YTSwiftyPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a new player
//        player = YTSwiftyPlayer(
//            frame: CGRect(x: 0, y: 0, width: 640, height: 480),
//            playerVars: [.videoID("I5fRFnbWYWw")])
        
//        , .playsInline(false), .origin(""), .progressBarColor(.red), .showModestbranding(true), .showControls(.show)

        // Enable auto playback when video is loaded
//        player.autoplay = true
//
//        // Set player view.
//        view = player
//
//        // Set delegate for detect callback information from the player.
//        player.delegate = self
//
//        // Load the video.
//        player.loadPlayer()
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.title = "Player"
//        let playerVars = ["autoplay" : 1, "playsinline": 1, "autohide": 1, "showinfo": 0, "controls": 1, "color": "red", "origin" : "http://youtube.com", "modestbranding" : 1] as [String : Any]
//        playerView.load(withVideoId: "T-wzhyTUCYc", playerVars: playerVars)
//        playerView.playerVars = ["autoplay" : 1 as AnyObject, "playsinline" : 0 as AnyObject, "modestbranding" : 1 as AnyObject, "controls" : 1 as AnyObject]
//        playerView.loadVideoID("T-wzhyTUCYc")
//                        playerVars: ["autoplay" : 1,
//                                     "playsinline" : 1,
//                                     "modestbranding" : 1,
//                                     "controls" : 0])
//        playerView.playVideo()
//    }
    
    
    

}


extension PlayerScreenViewController: PlayerScreenProtocol {
   
    func proceed() {
        
    }
}


