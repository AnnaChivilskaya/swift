//
//  ViewController.swift
//  vkontakte
//
//  Created by Аня on 31.01.2022.
//

import UIKit

class SendCashViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    
    let account = Account.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

   
        
    @IBAction func cashAction(_ sender: Any) {
    
    guard let cashString = cashTextField.text,
              let cash = Int(cashString),
              let name  =  nameTextField.text
        else  {
            return
        }
        account.name = name
        account.cash = cash
    
    }
}
