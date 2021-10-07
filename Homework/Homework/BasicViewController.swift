//
//  BasicViewController.swift
//  Homework
//
//  Created by Аня on 07.10.2021.
//

import UIKit

class BasicViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func Pressed(_ sender: Any) {
    }
    
}

extension BasicViewController: UINavigationControllerDelegate  {
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning)   ->
    UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
}


class InteractiveTransition: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    }
}
