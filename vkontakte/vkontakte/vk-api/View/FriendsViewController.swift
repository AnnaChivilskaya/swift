//
//  FriendsViewController.swift
//  vkontakte
//
//  Created by Аня on 31.01.2022.
//

import UIKit
import RealmSwift

 class FriendsViewController: UITableViewController {

     let friendsService = FriendsAPI()

     var friends: [Friends] = []
     //Services
     private let friendsAPI = FriendsAPI()
     private let friendsDB = FriendsDB()

     //Datasource

     private var token: NotificationToken?

     override func viewDidLoad() {
         super.viewDidLoad()


         friendsService.getFriends { [weak self] friend in
             self?.friends = friend
             self?.tableView.reloadData()
             Friends.getFriends { [weak self] friends in
             guard let self = self else { return }

            self.FriendsAPI.save(friends)
             self.friends = self.friendsDB.load()

             self.token = self.friends?.observe { [weak self] changes in
                 guard let self = self else { return }

                 switch changes {
                 case .initial:
                     self.tableView.reloadData()
                 case .update(_, let deletions, let insertions, let modifications):
                     self.tableView.beginUpdates()
                     self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                     self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                     self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                     self.tableView.endUpdates()
                 case .error(let error):
                     fatalError("\(error)")
                 }
             }
         }
     }

     
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

         guard case let friends = friends else { return 0 }
         return friends.count
     }


        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
         let friends = friends[indexPath.row]
        cell.textLabel?.text = friends.fullName
            let friends = friend[indexPath.row]
            cell.textLabel?.text = friends?.fullName

         if let imageUrl = URL(string:friends?.photo100 ?? "") {
             cell.imageView?.load(url: imageUrl)
         }

         return cell
     }
     }
 }
