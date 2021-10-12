//
//  ViewController.swift
//  HomeworkTwo
//
//  Created by Аня on 12.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var scrollview: UIScrollView!
    @IBOutlet private weak var logintext: UITextField!
    @IBOutlet private weak var passwordtext: UITextField!
    @IBOutlet private weak var Titleview: UITextField!
    @IBOutlet private weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
        self.animatetitles()
        self.animatetext()
        self.animatebutton()
        self.animatetitle()
        }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addObservers()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObservers()
    }

    private func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        self.scrollview.addGestureRecognizer(gesture)
    }

    @objc private func handleGesture() {
        self.scrollview.endEditing(true)
    }

    private func addObservers() {
        NotificationCenter.default
            .addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default
            .addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardWillShowNotification, object: nil)
    }

    private func removeObservers() {
        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }

    @objc private func handleKeyboardWillShow() {
        self.scrollview.contentInset.bottom += 120
    }

    @objc private func handleKeyboardWillHide() {
        self.scrollview.contentInset.bottom += 0

    }


    private func checkPassword() {
        let login = self.logintext.text
        let password = self.passwordtext.text

        if login == "admin" && password == "12345678" {
            self.showBoss()
        } else {
            self.showAllert()
    }
    }

    private func showBoss() {
        let storyBoard = UIStoryboard(name: "DebugMenu", bundle: nil)
        let viewController = storyBoard.instantiateInitialViewController()
        if let viewController = viewController as? DebugViewController {
            self.present(viewController, animated: true)
        }
    }

    private func showAllert() {
        let allertController = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)

        let action = UIAlertAction(title: "ОК", style: .cancel)

        allertController.addAction(action)
        self.present(allertController, animated: true)
    }

    @IBAction private func buttonpressed(_ sender: Any){
        self.checkPassword()
    }


func animatetitles () {
    let off = scrollview.bounds.width
    logintext.transform = CGAffineTransform(translationX: -off, y: 0)
    passwordtext.transform = CGAffineTransform(translationX: off, y: 0)
    
    UIView.animate (withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                    self.logintext.transform = .identity
                    self.passwordtext.transform = .identity
        
    }, completion: nil)
}
    
    func animatetitle() {
        self.Titleview.transform = CGAffineTransform(translationX: 0, y: -self.Titleview.bounds.height/2)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: {self.Titleview.transform = .identity}, completion: nil)
    }
    
func animatetext() {
        let fadeinanimation = CABasicAnimation(keyPath: "opacity")
        fadeinanimation.fromValue = 0
        fadeinanimation.toValue = 1
        fadeinanimation.duration = 1
        fadeinanimation.beginTime  = CACurrentMediaTime() + 1
        fadeinanimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        fadeinanimation.fillMode = CAMediaTimingFillMode.backwards
        
        self.logintext.layer.add(fadeinanimation, forKey: nil)
        self.passwordtext.layer.add(fadeinanimation, forKey: nil)
    }

func animatebutton() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 1
        animation.duration = 1
        animation.beginTime  = CACurrentMediaTime() + 1
        animation.fillMode   = CAMediaTimingFillMode.backwards
    
    button.layer.add(animation, forKey: nil)
    }
}
