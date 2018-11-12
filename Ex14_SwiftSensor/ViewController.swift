//
//  ViewController.swift
//  Ex14_SwiftSensor
//
//  Created by Lalita Narupiyakul on 8/11/2561 BE.
//  Copyright © 2561 Lalita Narupiyakul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isRed:Bool = false
    @IBOutlet weak var myView: UIView!
    
    @IBAction func handleTap(_ sender: Any) {
        if isRed {
            myView.backgroundColor = UIColor.green
            isRed = false
        } else {
            myView.backgroundColor = UIColor.blue
            isRed = true
        }
    }
    @IBAction func handleRotation(_ sender: Any) {
        self.imageView.transform = CGAffineTransform.identity.rotated(by: (sender as AnyObject).rotation)
    }
    
    
    @IBAction func handlePinch(_ sender: Any) {
        
        (sender as AnyObject).view?.transform = CGAffineTransform(scaleX: (sender as AnyObject).scale, y: (sender as AnyObject).scale)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func swipeMethod(_ sender: Any) {
        print("Image was swipe")
    }
    
    @IBAction func handlePanGesture(_ sender: Any) {
        let translation = (sender as AnyObject).translation(in: self.imageView)
        (sender as AnyObject).view?.center = CGPoint(x:((sender as AnyObject).view?.center.x)!+translation.x,y:((sender as AnyObject).view?.center.y)!+translation.y)
        (sender as AnyObject).setTranslation(CGPoint(x:0,y:0), in: self.imageView)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

