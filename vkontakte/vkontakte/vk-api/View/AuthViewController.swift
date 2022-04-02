//
//  AuthViewController.swift
//  vkontakte
//
//  Created by Аня on 31.01.2022.
//

import UIKit

class AuthViewController: UIViewController  {
     
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
        var subview = UIView()
        
        @IBAction func loginButtonPressed(_ sender: Any) {
            
        }
        
        override func viewDidLoad() {
            
            super.viewDidLoad()
            subview.center.x = view.center.x - 50
            subview.center.y = 500.0
            view.addSubview(subview)
            scrollView
                .addGestureRecognizer(
                    UITapGestureRecognizer(
                        target: self,
                        action: #selector(hideKeyboard)))
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(self.keyboardWasShown),
                name: UIResponder.keyboardWillShowNotification,
                object: nil)
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(self.keyboardWillBeHidden(notification:)),
                name: UIResponder.keyboardWillHideNotification,
                object: nil)
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            NotificationCenter.default.removeObserver(
                self,
                name: UIResponder.keyboardWillShowNotification,
                object: nil)
            NotificationCenter.default.removeObserver(
                self,
                name: UIResponder.keyboardWillHideNotification,
                object: nil)
        }
        
        @objc func keyboardWasShown(notification: Notification) {
            let info = notification.userInfo! as NSDictionary
            let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue)
                .cgRectValue
                .size
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
            
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
            UIView.animate(withDuration: 1) {
                self.scrollView.constraints
                    .first(where: { $0.identifier == "keyboardShown" })?
                    .priority = .required
                self.scrollView.constraints
                    .first(where: { $0.identifier == "keyboardHide" })?
                    .priority = .defaultHigh
                self.view.layoutIfNeeded()
            }
        }
        
        @objc func keyboardWillBeHidden(notification: Notification) {
            let contentInsets = UIEdgeInsets.zero
            scrollView.contentInset = contentInsets
            UIView.animate(withDuration: 1) {
                self.scrollView.constraints
                    .first(where: { $0.identifier == "keyboardShown" })?
                    .priority = .defaultHigh
                self.scrollView.constraints
                    .first(where: { $0.identifier == "keyboardHide" })?
                    .priority = .required
                self.view.layoutIfNeeded()
            }
        }
        
        @objc func hideKeyboard() {
            self.scrollView?.endEditing(true)
        }
        
        @objc func performLogin() {
            if !checkUser() {
                presentAlert()
            } else {
                clearData()
                performSegue(withIdentifier: "goToMain", sender: nil)
            }
        }
        
        private func checkUser() -> Bool {
            userTextField.text == "" && passwordTextField.text == ""
        }
        
        private func presentAlert() {
            let alertController = UIAlertController(
                title: "Error",
                message: "Incorrect username or password",
                preferredStyle: .alert)
            let action = UIAlertAction(title: "Close", style: .cancel)
            alertController.addAction(action)
            present(alertController,
                    animated: true)
        }
        
        private func clearData() {
            userTextField.text = ""
            passwordTextField.text = ""
        }


}
