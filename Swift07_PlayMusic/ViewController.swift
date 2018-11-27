//
//  ViewController.swift
//  Swift07_PlayMusic
//
//  Created by Lalita Narupiyakul on 22/11/2561 BE.
//  Copyright © 2561 Lalita Narupiyakul. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    var audioPlayer: AVAudioPlayer?
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func playMethod(_ sender: Any) {
        if audioPlayer!.isPlaying{
            audioPlayer!.pause()
            playButton.setTitle("Play", for: UIControl.State.normal)
        } else{
            audioPlayer?.play()
            playButton.setTitle("Pause", for: UIControl.State.normal)
        }
    }
    
    @IBAction func stopMethod(_ sender: Any) {
        audioPlayer?.stop()
        self.resetMethod()
    }
    
    @IBAction func volumeMethod(_ sender: Any) {
        audioPlayer?.volume = slider.value
    }
    
    func resetMethod() {
        slider.value = 0.5
        audioPlayer?.volume = 0.5
        audioPlayer?.currentTime = 0
        playButton.setTitle("Play", for: UIControl.State.normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let mp3Song = NSURL(fileURLWithPath: Bundle.main.path(forResource: "song", ofType: "mp3")!)
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            
        } catch _ {
            
        }
        do{
            try AVAudioSession.sharedInstance().setActive(true)
        } catch _{
            
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: mp3Song as URL)
        } catch _  {
            audioPlayer = nil
        }
        
        audioPlayer?.delegate = self
        audioPlayer?.prepareToPlay()
        audioPlayer?.volume = 0.5
        slider.value = 0.5
    }


}

