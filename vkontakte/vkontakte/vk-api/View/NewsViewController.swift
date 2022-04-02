//
//  NewsViewController.swift
//  vkontakte
//
//  Created by Аня on 29.03.2022.
//

import UIKit
import WebKit
import RealmSwift

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableViiew: UITableView!
    
    var feednews = [NewsModel]()
    var IndexCellForRowAt: post?

    override func viewDidLoad() {
        super.viewDidLoad()
        //TableViiew.delegate = self
        TableViiew.register(UINib(nibName: "Topnews", bundle: nil), forCellReuseIdentifier: "Top")
        TableViiew.register(UINib(nibName: "Textnews", bundle: nil), forCellReuseIdentifier: "Text")
        TableViiew.register(UINib(nibName: "Imageenews", bundle: nil), forCellReuseIdentifier: "Image")
        TableViiew.register(UINib(nibName: "Bottomnews", bundle: nil), forCellReuseIdentifier: "Bottom")
}

    enum post  {
        case top
        case text
        case bottom
        case image
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var cell = 4
        if feednews[section].text == nil {cell -= 1}
            if feednews[section].image == nil { cell -= 1 }
                return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        feednews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = feednews[indexPath.row]
        switch indexPath.row {
        case 0:
            IndexCellForRowAt = .top
        case 1:
            IndexCellForRowAt = (cells.text == nil) ? .image : .text
        case 2:
            IndexCellForRowAt = (cells.image == nil) ? .bottom : .image
        case 3:
            IndexCellForRowAt = .bottom
        default:
            IndexCellForRowAt = .none
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
                return 60
            }
        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 40
        }
}
