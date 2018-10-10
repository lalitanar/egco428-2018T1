//
//  ViewController.swift
//  Ex03_SequeModal
//
//  Created by Lalita Narupiyakul on 9/10/2561 BE.
//  Copyright © 2561 Lalita Narupiyakul. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var pName : String = ""
    @IBOutlet weak var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mainLabel.text = pName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! SecondViewController).pName = "Send from Main Page"
    }


}

