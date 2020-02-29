//
//  resultViewController.swift
//  My project
//
//  Created by 黒田桜介 on 2020/02/08.
//  Copyright © 2020 黒田桜介. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {
    //結果を表示するラベる
    @IBOutlet  var resultLabel: UILabel!
    var correctAnswer: Int = 0
   
    @IBAction func back() {
        self.presentingViewController?.presentingViewController?
            .dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            //Do any additional setup after loading the view.
            resultLabel.text = String(correctAnswer)
        
        }
}



