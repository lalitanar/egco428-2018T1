//
//  ViewController.swift
//  ex02_MasterDetail
//
//  Created by Lalita Narupiyakul on 9/10/2561 BE.
//  Copyright © 2561 Lalita Narupiyakul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var pName : String = ""
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = pName
        imageView.image = UIImage(named: pName+".png")
    }


}

