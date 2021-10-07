//
//  ViewController.swift
//  Homework
//
//  Created by Аня on 07.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var startView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
    }

    private func push() {
        let vc = UIStoryboard(name: "Basic", bundle: nil).instantiateInitialViewController()!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ButtonPressed(_ sender: Any) {
        self.push()
    }
}

extension ViewController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch operation {
        case .pop: return PopAnimator()
        case .push: return PushAnimator()
        default:  return nil
        }
    }
}

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let sourceView = transitionContext.viewController(forKey: .from)?.view else { return }
        guard let destinationView = transitionContext.viewController(forKey: .to)?.view else  { return }
        
        transitionContext.containerView.insertSubview(destinationView, belowSubview: sourceView)
        destinationView.frame.origin.x = 50
        destinationView.transform = .init(scaleX: 0.9, y: 0.9)
        
        let duration  =  transitionDuration(using: transitionContext)
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: []) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1)   {
                sourceView.frame.origin.x = transitionContext.containerView.frame.width
                sourceView.transform =  .init(scaleX: 1.1, y: 1.1)
                destinationView.transform =   .identity
                destinationView.frame.origin.x = 0
        }
        } completion: { didCompleted in
            transitionContext.completeTransition(didCompleted)
        }
    }
}

class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning  {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let sourceView = transitionContext.viewController(forKey: .from)?.view else { return }
        guard let destinationView = transitionContext.viewController(forKey: .to)?.view else  { return }
        

        transitionContext.containerView.addSubview(destinationView)
        destinationView.frame.origin.x  = transitionContext.containerView.frame.width
        destinationView.transform =   .init(scaleX: 1.1, y: 1.1)
        
        let duration =  transitionDuration(using: transitionContext)
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: []) {
            //1
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                sourceView.transform   =  .init(scaleX: 0.9, y: 0.9)
            }
            //2
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.7) {
                sourceView.frame.origin.x = 50
            }
            //3
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                destinationView.transform =  .identity
                destinationView.frame.origin.x = 0
            }
            

            
        } completion: { didComplete in
            sourceView.removeFromSuperview()
            transitionContext.completeTransition(didComplete)
        }
    }
}
    
    
