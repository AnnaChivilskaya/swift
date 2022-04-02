//
//  PhotoViewController.swift
//  vkontakte
//
//  Created by Аня on 01.02.2022.
//

import UIKit

class PhotoViewController: UITableViewController {
    
    let PhotosService = PhotoAPI()
    var photos: [PhotoDB] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        PhotosService.getPhotos { [weak self] photos in
            self?.photos = photos
            self?.tableView.reloadData()
        }

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return photos.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
//        let photo = photos[indexPath.row]
//        
//        cell.textLabel?.text = photos
        

        return cell
    }
    
}
