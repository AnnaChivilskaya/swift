//
//  DetailViewController.swift
//  vkontakte
//
//  Created by Аня on 31.01.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cashLabel: UILabel!
    
    let account = Account.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = account.name
        cashLabel.text = String(account.cash)
    }
    


}
