//
//  AViewController.swift
//  vkontakte
//
//  Created by Аня on 31.01.2022.
//

import UIKit

class AViewController: UIViewController,  BViewControllerDelegate {

    @IBOutlet weak var alphabetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
   
    @IBAction func chooseAlphabet(_ sender: Any) {
    
        let bVC = BViewController()
        bVC.delegate = self
        
        navigationController?.pushViewController(bVC, animated: true)
    }
    
    func alphabetChoosen(alphabet: String) {
        self.alphabetLabel.text = alphabet
    }
}
