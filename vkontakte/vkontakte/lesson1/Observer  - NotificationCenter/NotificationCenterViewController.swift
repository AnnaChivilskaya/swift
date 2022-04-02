//
//  NotificationCenterViewController.swift
//  vkontakte
//
//  Created by Аня on 31.01.2022.
//

import UIKit

let changeColorNotification = Notification.Name("changeColorNotification")

class NotificationCenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(changeColor(notification:)), name: changeColorNotification, object: nil)
    }
    
    @objc
    private func changeColor(notification: Notification) {
        
        guard let color = notification.userInfo?["color"] as? UIColor else { return }
        
        view.backgroundColor  = color
    }

    
    @IBAction func sendNotificationAction(_ sender: Any) {
    
        let color = UIColor.red
        NotificationCenter.default.post(name: changeColorNotification, object: nil, userInfo: ["color": color])
    
    }
    
}