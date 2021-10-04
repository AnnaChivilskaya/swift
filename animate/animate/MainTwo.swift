//
//  MainTwo.swift
//  animate
//
//  Created by Аня on 04.10.2021.
//

import UIKit

class MainTwo : UIViewController {
    
    @IBOutlet weak var animatelayer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func Animate() {
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: { UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8) { self.animatelayer.transform = .init(scaleX: 0.5, y: 0.5) }

    
        UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.6) { self.animatelayer.frame.origin.y += 100 }
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4)  {self.animatelayer.frame.origin.x   -= 100 }
            
        }, completion: nil)
        
    }
    
    
    @IBAction func ButtonPressed(_ sender: Any) {
        self.Animate()
    }
}
