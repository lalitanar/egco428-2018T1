//
//  ViewController.swift
//  Ex04_imageJump
//
//  Created by Lalita Narupiyakul on 9/10/2561 BE.
//  Copyright © 2561 Lalita Narupiyakul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var jumpButton: UIButton!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func speedMethod(_ sender: Any) {
        imageView.animationDuration = TimeInterval(2-slider.value)
        imageView.startAnimating()
    }
    
    @IBAction func startstopMethod(_ sender: Any) {
        if imageView.isAnimating {
            imageView.stopAnimating()
            jumpButton.setTitle("Sit Still", for: UIControl.State.normal)
        } else{
            imageView.startAnimating()
            jumpButton.setTitle("Stop", for: UIControl.State.normal)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var imageList: [UIImage] = []
        for i in 1...20 {
            let fn = "frame-"+String(format: "%d", i)+".png"
            let vImage = UIImage(named: fn)
            imageList.append(vImage!)
        }
        imageView.animationImages = imageList
        imageView.animationDuration = 1

    }
}

