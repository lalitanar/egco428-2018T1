//
//  SecondViewController.swift
//  Ex03_SequeModal
//
//  Created by Lalita Narupiyakul on 9/10/2561 BE.
//  Copyright © 2561 Lalita Narupiyakul. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var pName : String = ""
    @IBOutlet weak var secondLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        secondLabel.text = pName
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        (segue.destination as! MainViewController).pName = "Send from Second Page"
    }
 

}
