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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
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
}
