//
//  ViewController.swift
//  HomeworkSeven
//
//  Created by Аня on 30.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet private weak var titleview: UILabel!
    @IBOutlet private weak var loginview: UILabel!
    @IBOutlet private weak var passwordview: UILabel!
    @IBOutlet private weak var logintext: UITextField!
    @IBOutlet private weak var passwordtext: UITextField!
    @IBOutlet private weak var butt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.animatetext()
        self.animatetitle()
        self.animatetitles()
        self.animatebutton()
    }

    func animatetitles() {
        let off = view.bounds.width
        loginview.transform = CGAffineTransform(translationX: -off, y: 0)
        passwordview.transform = CGAffineTransform(translationX: off, y: 0)
        
        UIView.animate (withDuration: 0.5,
                        delay: 0.5,
                        options: .curveEaseOut,
                        animations: {
                            self.loginview.transform = .identity
                            self.passwordview.transform = .identity
                        },
                        completion: nil)
}
    func animatetitle() {
            self.titleview.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.height/2)
            
        UIView.animate(withDuration: 0.5,
                       delay: 0.5,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0,
                           options: .curveEaseOut, animations:  {
                            self.titleview.transform =  .identity
                            },
                           completion: nil)
        }
        
   func animatetext() {
            let fadeInAnimation = CABasicAnimation(keyPath: "opacity")
            fadeInAnimation.fromValue = 0
            fadeInAnimation.toValue = 1
            fadeInAnimation.duration = 1
            fadeInAnimation.beginTime = CACurrentMediaTime() + 1
            fadeInAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
            fadeInAnimation.fillMode = CAMediaTimingFillMode.backwards
            
            self.logintext.layer.add(fadeInAnimation, forKey: nil)
            self.passwordtext.layer.add(fadeInAnimation, forKey: nil)
        }
        
        
    func animatebutton() {
            let animation = CASpringAnimation(keyPath: "transform.scale")
            animation.fromValue = 0
            animation.toValue = 1
            animation.stiffness = 200
            animation.mass = 1
            animation.duration = 1
            animation.beginTime = CACurrentMediaTime() + 1
            animation.fillMode = CAMediaTimingFillMode.backwards
            
            self.butt.layer.add(animation, forKey: nil)
    }
    

        
        
}

