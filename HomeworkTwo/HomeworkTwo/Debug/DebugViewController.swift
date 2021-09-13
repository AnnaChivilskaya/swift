//
//  DebugViewController.swift
//  HomeworkTwo
//
//  Created by Аня on 13.09.2021.
//

import UIKit

class DebugViewController : UIViewController {
    
    @IBOutlet weak var News: UIButton!
    @IBOutlet weak var Music: UIButton!
    @IBOutlet weak var Message: UIButton!
    
    private func check() {
        let glavnaya = self.News.buttonType
        let music = self.Music.buttonType
        let message = self.Message.buttonType
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
