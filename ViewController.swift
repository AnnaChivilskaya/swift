//
//  ViewController.swift
//  HomeworkOne
//
//  Created by Аня on 07.09.2021.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var logintextfield: UITextField!
    @IBOutlet private weak var passwordtextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addObeservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.removeObservers()
    }
    
    
    private func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        self.scrollView.addGestureRecognizer(gesture)
    }

    @objc private func  handleGesture() {
        self.scrollView.endEditing(true)
    }
    
    
    
    private func addObeservers() {
        NotificationCenter.default
            .addObserver(self, selector: #selector(handleKeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        
        NotificationCenter.default
            .addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        
    }
    
    private func removeObservers() {
        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        
        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    
    }
    
    @objc private func handleKeyboardWillShow() {
        self.scrollView.contentInset.bottom += 120
    }
    
    @objc private func handleKeyboardWillHide() {
        self.scrollView.contentInset.bottom = 0
    }

    @IBAction private func button(_ sender: Any) {
        let login = self.logintextfield.text
        let password = self.passwordtextfield.text
        
        if login == "admin" && password == "654321" {
        print("Пользователь авторизирован")
    } else {
    print("Авторизация не прошла")
    }
    
}
}
