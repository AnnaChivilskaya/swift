//
//  BasicTableViewCell.swift
//  HomeworkFive
//
//  Created by Аня on 24.09.2021.
//

import UIKit

class BasicTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    

    func configure(with item: BasicDisplayItem) {
        self.cityLabel.text = item.city
        self.temperatureLabel.text = "\(item.temperature)C"
    }
}

struct BasicDisplayItem {
    let city: String
    let temperature: Int
}
