//
//  BasicTableViewCell.swift
//  HomeworkTwo
//
//  Created by Аня on 16.09.2021.
//

import UIKit

class BasicTableViewCell: UITableViewCell {

    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    
    
    func configure(with item: BasicDisplayItem) {
        self.cityLabel.text = item.city
        self.tempLabel.text =  "\(item.temp) C"
    }
}

struct BasicDisplayItem {
    let city: String
    let temp: Int
}
