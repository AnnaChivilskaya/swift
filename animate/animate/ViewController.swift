//
//  ViewController.swift
//  animate
//
//  Created by Аня on 04.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var startlabel: UILabel!
    @IBOutlet private weak var startone: UIButton!
    @IBOutlet private weak var startttwo: UIButton!
    @IBOutlet private weak var labelanimation: UILabel!
    @IBOutlet private weak var labelAnimation: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.start()
        
    }
    func start() {
        self.startlabel.transform = CGAffineTransform(translationX:0, y: -self.view.bounds.height/2)
        
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: {self.startlabel.transform = .identity}, completion: nil)
    }

}
