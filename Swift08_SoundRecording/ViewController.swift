//
//  ViewController.swift
//  Swift08_SoundRecording
//
//  Created by Lalita Narupiyakul on 22/11/2561 BE.
//  Copyright © 2561 Lalita Narupiyakul. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    
    @IBOutlet weak var recordButton: UIButton!
   
    @IBOutlet weak var playButton: UIButton!
    
    @IBAction func recordMethod(_ sender: Any) {
        if (audioRecorder!.isRecording){
            audioRecorder!.stop()
            recordButton.setTitle("Record", for: UIControl.State.normal)
            playButton.isEnabled = true
        } else{
            audioRecorder!.record()
            recordButton.setTitle("Stop", for: UIControl.State.normal)
            playButton.isEnabled = false
        }
    }
    
    @IBAction func playMethod(_ sender: Any) {
        if(!audioRecorder!.isRecording){
            var error: NSError?
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: (audioRecorder?.url)!)
            }catch let error1 as NSError{
                error = error1
                audioPlayer = nil
            }
            if error != nil{
                print("An error \(String (describing: error)) occured")
            }
            else {
                audioPlayer?.play()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fileManager = FileManager()
        let documentFolderUrl = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let fileURL = documentFolderUrl?.appendingPathComponent("Recording.m4a")
        let audioSetting = [AVFormatIDKey : kAudioFormatMPEG4AAC as NSNumber, AVSampleRateKey : 16000.0 as NSNumber, AVNumberOfChannelsKey : 1 as NSNumber, AVEncoderAudioQualityKey : AVAudioQuality.low.rawValue as NSNumber]
        do{
            audioRecorder = try AVAudioRecorder(url: fileURL!, settings: audioSetting)
        } catch _ {
            audioRecorder = nil
        }
    }
}

