//
//  Constants.swift
//  HomeworkTwo
//
//  Created by Аня on 16.09.2021.
//

import UIKit

enum Constants {
    enum Storyboard {
        static let debugMenu: UIStoryboard = .init(name: "DebugMenu", bundle: nil)
        static let collections: UIStoryboard = .init(name: "Collections", bundle: nil)
    }
    
    
    enum Nib {
        static let basic: UINib = .init(nibName: "BasicTableViewCell", bundle: nil)
    }
    
    enum Cell {
        static let basic: String = "BasicCell"
    }
}
