//
//  ViewController.swift
//  Swift09_VideoPlayer
//
//  Created by Lalita Narupiyakul on 22/11/2561 BE.
//  Copyright © 2561 Lalita Narupiyakul. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
var movieURL:URL = URL(string: "http://www.ebookfrenzt.com/ios_book/movie/movie.mov")!
    
    
    @IBAction func playMethod(_ sender: Any) {
        let player = AVPlayer(url: movieURL)
        let playerController = AVPlayerViewController()
        
        playerController.player = player
        self.addChild(playerController)
        self.view.addSubview(playerController.view)
            playerController.view.frame = self.view.frame
        
        player.play()
    }

    @IBOutlet weak var playButton: UIButton!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! AVPlayerViewController
        
        destination.player = AVPlayer(url: movieURL)
    }


}

