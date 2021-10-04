//
//  MainOne.swift
//  animate
//
//  Created by Аня on 04.10.2021.
//

import UIKit

class MainOne : UIViewController {
    
@IBOutlet private weak var animationView: UIView!
    
override func viewDidLoad() {
    super.viewDidLoad()
}
    private func animate() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.duration =  1
        animation.fromValue = 1
        animation.toValue = 0
        animation.fillMode = .removed
        animation.isRemovedOnCompletion = false
        
        self.animationView.layer.add(animation, forKey: nil)
    }
    
    
@IBAction func buttonpressed(_ sender: Any) {
    self.animate()
    }
    
}
