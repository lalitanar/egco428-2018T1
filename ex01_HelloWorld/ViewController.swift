//
//  ViewController.swift
//  ex01_HelloWorld
//
//  Created by 6272 on 25/9/2561 BE.
//  Copyright © 2561 6272. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputText: UILabel!
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    @IBAction func submitMethod(_ sender: Any) {
        outputText.text = inputText.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

