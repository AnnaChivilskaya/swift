//
//  ViewController.swift
//  HomeworkFive
//
//  Created by Аня on 20.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var logintext: UITextField!
    @IBOutlet private weak var passwordtext: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    private func checkPassword(){
        let log = self.logintext.text
        let pass = self.passwordtext.text
        
        if log == "admin" && pass == "12345" {
            self.showAdmin()
        } else {
            self.showAllert()
        }
    }
    
    private func showAdmin() {
        let viewController = Constants.Storyboard.debugMenu.instantiateInitialViewController()
        if let viewController = viewController as? DebugViewController {
            self.present(viewController, animated: true)
        }
    }
    
    private func showAllert() {
        let allertController = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ок", style: .cancel)
            
            allertController.addAction(action)
            self.present(allertController, animated: true)

        }
    
    private func present() {
        
        if let tabbar = UIStoryboard(name: "TabBar", bundle: nil).instantiateInitialViewController() {
            self.present(tabbar, animated: true)
        }
        
    }
    
   
    @IBAction private func buttonpressed(_ sender: Any) {
    //    self.checkPassword()
        self.present()
    }
    
}

