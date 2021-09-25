//
//  Constants.swift
//  HomeworkFive
//
//  Created by Аня on 20.09.2021.
//

import UIKit

enum Constants {

enum Storyboard {
    static let debugMenu: UIStoryboard = .init(name: "DebugMenu", bundle: nil)
    static let collection: UIStoryboard = .init(name: "Collection", bundle: nil)
}
    
    enum Nib {
        static let basic: UINib = .init(nibName: "BasicTableViewCell", bundle: nil)
        static let header: UINib = .init(nibName: "TableViewHeaderView", bundle: nil)
    }
    
    enum Cell {
        static let basic: String = "BasicCell"
        static let header: String = "TableViewHeaderView"
    }
}
