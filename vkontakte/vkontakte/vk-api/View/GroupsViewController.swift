//
//  GroupsViewController.swift
//  vkontakte
//
//  Created by Аня on 01.02.2022.
//

import UIKit

class GroupsViewController: UITableViewController {
    
    let GroupsService = Groups()
    var groups: [GroupsDB] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        GroupsService.getGroups  { [weak self] groups in
            self?.groups = groups
            self?.tableView.reloadData()
        }

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groups.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
//        let groups = groups[indexPath.row]
//        
//        cell.textLabel?.text = groups.fullnamegroups
//        

        return cell
    }
    
}
