
//
//  CollectionViewController.swift
//  HomeworkTwo
//
//  Created by Аня on 16.09.2021.
//

import UIKit

class CollectionController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var displayItems: [BasicDisplayItem] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(Constants.Nib.basic, forCellReuseIdentifier: Constants.Cell.basic)
        self.getData()
    }
    
    
    
    private func getData() {
        let mItems: [BasicDisplayItem] = [
            .init(city: "Москва", temp: 9),
            .init(city: "Казань", temp: 15),
            .init(city: "Новосибирск", temp: 13),
            .init(city: "Екатеринбург", temp: 11)
        ]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.displayItems = mItems
            self.tableView.reloadData()
        }
    }
}



